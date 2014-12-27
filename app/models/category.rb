class Category < ActiveRecord::Base
  belongs_to :user
  has_many :todos, dependent: :destroy

  def todos_by_day opts={}
    desired_day = DateTime.parse(Time.at(opts[:timestamp]/1000).to_s).beginning_of_day
    next_day = desired_day + 1

    query = todos.where(
      'updated_at > :earlier_bound AND updated_at <= :later_bound', { 
        earlier_bound: desired_day, 
        later_bound: next_day
      })
    
    query = query.where(completed: false) if opts[:incomplete_only]
    query
  end

  def mark_as_inactive
    self.active = false
    self.date_marked_inactive = DateTime.now
    self.save!
  end
end
