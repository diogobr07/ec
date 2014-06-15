class SiteController < ApplicationController
  def home
    @slider = Slider.find_by(identifier: 'home')
    @recent_posts = Post.get_recent_posts
  end

  def post_by_slug
    @post = Post.find_by_slug(params[:slug])
    render :post
  end

  def posts_by_author
    @posts = Post.find_by_author(params[:slug])
    render :posts
  end

  def posts_by_category
    @posts = Post.find_by_category(params[:slug])
    render :posts
  end

  def posts_by_tag
    @posts = Post.find_by_tag(params[:slug])
    render :posts
  end

  def teste
  	@recent_posts = Post.get_recent_posts
  	render layout: false
  end
end
