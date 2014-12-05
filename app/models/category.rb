class Category < ActiveRecord::Base
  belongs_to :user
  has_many :todos, dependent: :destroy

  def todays_todos
    todos.where("updated_at > ?", DateTime.now.beginning_of_day )
  end
end
