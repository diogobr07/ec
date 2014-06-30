class SiteController < ApplicationController
  def home
    @slider = Slider.find_by(identifier: 'home')
    @content = Post.find({by: :recent, count: 2})
  end

  def post_by_slug
    @post = Post.find_by_slug(params[:slug])
    render :post
  end

  def posts_by_author
    @content = Post.find({by: :author, slug: params[:slug], count: 2, page: params[:page]})
    render :posts
  end

  def posts_by_category
    @content = Post.find({by: :category, slug: params[:slug], count: 2, page: params[:page]})
    render :posts
  end

  def posts_by_tag
    @content = Post.find({by: :tag, slug: params[:slug], count: 2, page: params[:page]})
    render :posts
  end

  def recent_posts
  	@content = Post.find({by: :recent, count: 2, page: params[:page]})
    render :posts
  end
end
