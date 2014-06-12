class SiteController < ApplicationController
  def home
    @slider = Slider.find_by(identifier: 'home')
    @recent_posts = Post.get_recent_posts
  end

  def post_by_slug
    @post = Post.find_by_slug(params[:slug])
    render :post
  end

  def teste
  	@recent_posts = Post.get_recent_posts
  	render layout: false
  end
end
