class Post < ActiveRecord::Base
  has_attached_file :image, 
    :styles => { :medium => "200x200>", :thumb => "100x100>" },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
    
  validates :title, :body, :image, presence: true

  belongs_to :user
end
