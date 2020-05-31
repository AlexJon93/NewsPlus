require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:one)
        @post = posts(:one)
    end

    test 'should show valid post' do
        login_as(@user)
        get post_path(@post)
        assert_response :success
        assert_select 'h2', @post.title
        assert_select 'p', @post.content
    end

    test 'should create new post' do
        login_as(@user)
        get new_post_path
        assert_response :success
        assert_difference 'Post.count', 1 do
            post posts_path, params: {
                post: {
                    topic: @post.topic,
                    content: @post.content,
                    title: 'Newly created title'
                }
            }
        end
        post = Post.last
        assert_redirected_to post
        follow_redirect!
        assert_select 'h2', post.title
    end

    test 'should not create invalid post' do
        login_as(@user)
        get new_post_path
        assert_response :success
        assert_no_difference 'Post.count' do
            post posts_path, params: {
                post: {
                    topic: '',
                    content: '',
                    title: ''
                }
            }
        end
        assert_redirected_to new_post_path
        follow_redirect!
        assert_not flash.empty?
        get root_path
        assert flash.empty?
    end

    test 'should filter posts' do
        login_as(@user)
        get root_path
        get update_home_path(filter: 'filtered'), xhr: true
        refute_match 'post panel', response.body
        get update_home_path(topic: @post.topic), xhr: true
        assert_match 'post panel', response.body
        get update_home_path(filter: 'recent'), xhr: true
        assert_match 'post panel', response.body
    end
end
