class AddColumnImageToSlides < ActiveRecord::Migration
  def up
    add_attachment :slides, :image
  end

  def down
  	remove_attachment :slides, :image
  end
end
