class BlogPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @blog_posts = BlogPost.all.order(created_at: :desc)
  end

  def show
    @blog_post = BlogPost.find(params[:id])
    @search_results = Unsplash::Photo.search(@blog_post.title)
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = current_user.blog_posts.build(blog_post_params)

    if @blog_post.save
      redirect_to @blog_post, notice: 'Blog post was successfully created.'
    else
      render :new
    end
  end

  def edit
    @blog_post = current_user.blog_posts.find(params[:id])
  end

  def update
    @blog_post = current_user.blog_posts.find(params[:id])

    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: 'Blog post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog_post = current_user.blog_posts.find(params[:id])
    @blog_post.destroy

    redirect_to blog_posts_url, notice: 'Blog post was successfully destroyed.'
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :content)
  end
end
