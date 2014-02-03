class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
