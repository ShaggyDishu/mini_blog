require 'test_helper'

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @blog_post = blog_posts(:one)
  end

  test "should get index" do
    get blog_posts_url
    assert_response :success
  end

  test "should show blog_post" do
    get blog_post_url(@blog_post)
    assert_response :success
  end

  test "should get new" do
    get new_blog_post_url
    assert_response :success
  end

  test "should create blog_post" do
    assert_difference('BlogPost.count') do
      post blog_posts_url, params: { blog_post: { title: "New Post", content: "Lorem ipsum", user_id: @user.id } }
    end
    assert_redirected_to blog_post_url(BlogPost.last)
  end

  test "should get edit" do
    get edit_blog_post_url(@blog_post)
    assert_response :success
  end

  test "should update blog_post" do
    patch blog_post_url(@blog_post), params: { blog_post: { title: "Updated Post", content: "Updated content" } }
    assert_redirected_to blog_post_url(@blog_post)
    @blog_post.reload
    assert_equal "Updated Post", @blog_post.title
    assert_equal "Updated content", @blog_post.content
  end

  test "should destroy blog_post" do
    assert_difference('BlogPost.count', -1) do
      delete blog_post_url(@blog_post)
    end
    assert_redirected_to blog_posts_url
  end

end
