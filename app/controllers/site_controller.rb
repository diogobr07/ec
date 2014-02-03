class SiteController < ApplicationController
  def home
    @slider = Slider.find_by(identifier: 'home');
  end
end
