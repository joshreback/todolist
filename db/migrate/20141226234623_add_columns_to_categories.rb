class AddColumnsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :active, :boolean
    add_column :categories, :date_marked_inactive, :timestamp
  end
end
