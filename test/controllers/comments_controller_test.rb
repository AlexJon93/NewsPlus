require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
    def setup
        @post = posts(:one)
        @comment = comments(:one)
        @user = users(:one)
    end

    test 'should create valid comment' do
        login_as(@user)
        get post_path(@post)
        assert_response :success
        assert_difference 'Comment.count', 1 do
            post post_comments_path(@post), params: {
                content: @comment.content
            }
        end
        assert_redirected_to post_path(@post)
        follow_redirect!
        assert flash.empty?
        assert_select 'div.comment-content', @comment.content
    end

    test 'should not create invalid comment' do
        login_as(@user)
        get post_path(@post)
        assert_response :success
        assert_no_difference 'Comment.count' do
            post post_comments_path(@post), params: {
                content: ''
            }
        end
        assert_redirected_to post_path(@post)
        follow_redirect!
        assert_not flash.empty?
        assert_select 'div.comment-content', @comment.content, count: 0
    end
end