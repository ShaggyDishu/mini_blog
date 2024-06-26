require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @blog_post = BlogPost.new(title: 'Test Title', content: 'Test Content', user: @user)
  end

  test "should be valid" do
    assert @blog_post.valid?
  end

  test "should require a title" do
    @blog_post.title = nil
    assert_not @blog_post.valid?
  end

  test "should require content" do
    @blog_post.content = nil
    assert_not @blog_post.valid?
  end

  test "should belong to a user" do
    assert_instance_of User, @blog_post.user
  end
end
