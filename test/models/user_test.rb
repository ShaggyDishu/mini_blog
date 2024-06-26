require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'test@example.com', password: 'password')
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = ''
    assert_not @user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test "should have many blog posts" do
    @user.save
    assert_difference('@user.blog_posts.count', 1) do
      @user.blog_posts.create(title: "Test Post", content: "This is a test post.")
    end
  end
end
