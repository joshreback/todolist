class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :content
      t.boolean :completed
      t.boolean :active

      t.timestamps
    end
  end
end
