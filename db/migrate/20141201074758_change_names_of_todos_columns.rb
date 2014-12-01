class ChangeNamesOfTodosColumns < ActiveRecord::Migration
  def change
    rename_column :todos, :content, :name
    rename_column :todos, :active, :status 
  end
end
