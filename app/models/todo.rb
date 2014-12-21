class Todo < ActiveRecord::Base
  belongs_to :category

  class << self
    # Returns a hash of everything the user did and did not accomplish on
    # a particular day.
    #
    # Args:
    #   day - Javascript timestamp corresponding to the day to fetch TODOS.
    #
    # Returns:
    #   hash of categories => todos on that particular day. 
    def snapshot timestamp
      desired_day = DateTime.parse(Time.at(timestamp/1000).to_s).beginning_of_day
      next_day = desired_day + 1

      todos_on_day = Todo.where("updated_at > :desired_day AND updated_at < :next_day",
        desired_day: desired_day.to_date,
        next_day: next_day.to_date)

      categories_to_todos = {}
      todos_on_day.each do |todo|
        if categories_to_todos.has_key? todo.category.name
          categories_to_todos[todo.category.name] << todo
        else
          categories_to_todos[todo.category.name] = [todo]
        end
      end
      categories_to_todos
    end
  end
end
