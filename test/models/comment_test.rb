require 'test_helper'

class CommentTest < ActiveSupport::TestCase
    def setup
        @user = users(:one)
        @post = posts(:one)
        @comment = @post.comments.build(content: 'Testing',  user_id: @user.id)
    end

    test 'Comment should be valid' do
        assert @comment.valid?
    end

    test 'User id should be present' do
        @comment.user_id = nil
        assert_not @comment.valid?
    end

    test 'Post id should be present' do
        @comment.post_id = nil
        assert_not @comment.valid?
    end

    test 'Content should be present' do
        @comment.content = '    '
        assert_not @comment.valid?
    end
end