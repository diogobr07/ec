class Slide < ActiveRecord::Base
  has_attached_file :image, 
  	:styles => { :medium => "300x300>", :thumb => "100x100>" },
  	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  validates :title, :description, :link, :display_order, :image, presence: true
  
  belongs_to :slider

  scope :by_display_order, -> { order('display_order') }
  scope :enabled, -> { where('enabled = true') }

end
