require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get show" do
    get user_path(@user)
    assert_response :success
    assert_template 'users/show'
    assert_select 'h3.username', @user.username
  end

  test "should create valid user" do
    get signup_path
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: {
        user: {
          username: 'TestName',
          email: 'testemail@gmail.com',
          mobile: '0412345678',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end
    assert_redirected_to login_path
  end

  test "should reject invalid user" do
    get signup_path
    assert_response :success
    assert_no_difference 'User.count' do
      post users_path, params: {
        user: {
          username: '',
          email: 'testemail@gmail.com',
          mobile: '0412345678',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end
    assert_redirected_to signup_path
    follow_redirect!
    assert_not flash.empty?
  end

  test 'should make valid user edit' do
    name = 'DifferentName'
    login_as(@user)
    get edit_user_path(@user)
    assert_response :success
    assert_template 'users/edit'
    patch user_path(@user), params: {
      user: {
        username: name,
        email: @user.email
      }
    }
    assert_redirected_to user_path(@user)
    @user.reload
    assert_equal name, @user.username
  end

  test 'should not make invalid user edit' do
    login_as(@user)
    get edit_user_path(@user)
    assert_response :success
    assert_template 'users/edit'
    patch user_path(@user), params: {
      user: {
        username: ''
      }
    }
    assert_redirected_to edit_user_path(@user)
    follow_redirect!
    assert_not flash.empty?
  end

  test 'should get my comments, replies, posts page' do
    login_as(@user)
    get user_posts_path(@user)
    assert_response :success
    assert_template 'users/posts'
    get user_replies_path(@user)
    assert_response :success
    assert_template 'users/replies'
    get user_comments_path(@user)
    assert_response :success
    assert_template 'users/comments'
  end
end
