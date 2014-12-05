class RemoveStatusFromTodos < ActiveRecord::Migration
  def change
    remove_column :todos, :status
  end
end
