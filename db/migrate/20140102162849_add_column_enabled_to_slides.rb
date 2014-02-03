class AddColumnEnabledToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :enabled, :boolean, after: :display_order
  end
end
