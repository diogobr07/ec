class Post < ActiveRecord::Base
  include HTTParty

  base_uri '192.168.0.72/wordpress/api/core'

  has_attached_file :image, 
    :styles => { :medium => "200x200>", :thumb => "100x100>" },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
    
  validates :title, :body, :image, presence: true

  belongs_to :user

  def self.get_recent_posts
  	response = self.get('/get_recent_posts', { query: {count: 2} });
    JSON.parse(response.body)
  end
end
