require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = @user.posts.build(content: 'This is a post', title: 'Example post', topic: 'Examples')
  end

  test 'Post should be valid' do
    assert @post.valid?
  end

  test 'User id should be present' do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test 'Content should be present' do
    @post.content = '    '
    assert_not @post.valid?
  end

  test 'Title should be present' do
    @post.title = '    '
    assert_not @post.valid?
  end

  test 'Title should not exceed max length' do
    @post.title = 'a'*251
    assert_not @post.valid?
  end

  test 'Topic should be present' do
    @post.topic = '    '
    assert_not @post.valid?
  end

  test 'Topic should not exceed max length' do
    @post.topic = 'a'*61
    assert_not @post.valid?
  end
end
