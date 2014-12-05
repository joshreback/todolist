class Category < ActiveRecord::Base
  belongs_to :user
  has_many :todos, dependent: :destroy

  def todays_todos
    todos.where("updated_at > ?", DateTime.now.beginning_of_day )
  end

  def yesterdays_todos
    todos.where(
      'updated_at > :yesterday AND updated_at <= :today', 
      { 
        yesterday: DateTime.yesterday.beginning_of_day, 
        today: DateTime.now.beginning_of_day
      },
      completed: false
    )
  end
end
