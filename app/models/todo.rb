class Todo < ActiveRecord::Base
  belongs_to :category

  class << self
    # Creates todos for today
    def create_todos_for_today todos
      todays_todos = []

      todos.each do |todo| 
        todays_todos << Todo.create(name: todo.name, completed: false, category_id: self.id)
      end
      todays_todos
    end
  end
end
