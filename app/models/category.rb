class Category < ActiveRecord::Base
  belongs_to :user
  has_many :todos, dependent: :destroy

  def todos_by_day opts={}
    desired_day = DateTime.parse(Time.at(opts[:timestamp]/1000).to_s).beginning_of_day
    next_day = desired_day + 1

    query = todos.where(
      'updated_at > :earlier_bound AND updated_at <= :later_bound', { 
        earlier_bound: DateTime.yesterday.beginning_of_day, 
        later_bound: DateTime.now.beginning_of_day
      })

    query = query.where(completed: false) if opts[:incomplete_only]
  end
end
