class Slider < ActiveRecord::Base
	validates_presence_of :identifier
	validates_uniqueness_of :identifier
	has_many :slides, dependent: :destroy
end
