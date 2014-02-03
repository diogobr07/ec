class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.references :slider, index: true
      t.string :title
      t.string :description
      t.string :link
      t.integer :display_order

      t.timestamps
    end
  end
end
