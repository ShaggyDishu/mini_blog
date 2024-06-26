class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  skip_before_action :authenticate_user!, only: :home

  def home
    @blog_posts = BlogPost.all.order(created_at: :desc)
  end

end
