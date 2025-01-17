require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'should login with valid details and then logout' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {
      session: {
        email: @user.email,
        password: 'password'
      }
    }
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'posts/index'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to login_path
    delete logout_path
  end

  test 'should not login with invalid details' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {
      session: {
        email: "",
        password: ""
      }
    }
    assert_redirected_to login_path
    follow_redirect!
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
