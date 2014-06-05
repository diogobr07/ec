class SiteController < ApplicationController
  def home
    @slider = Slider.find_by(identifier: 'home');
  end

  def teste
  	@recent_posts = Post.get_recent_posts
  	render layout: false
  end
end
