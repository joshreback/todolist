class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  
  has_many :categories, dependent: :destroy

  def active_categories opts={}
    if opts[:day_timestamp]
      # If a date is specified, then we want all categories that were active on a certain day
      desired_day = timestamp_to_date opts["day_timestamp"]
      query       = categories.where('date_marked_inactive > :date_bound', { date_bound: desired_day })
      query.concat categories.where('active = true AND created_at < :date_bound', { date_bound: desired_day })
    else 
      # If no date is specified, just fetch all categories that are still active
      query = categories.where("active is NOT false")
    end
    query
  end

  private

  def timestamp_to_date day_timestamp
    DateTime.parse(Time.at(day_timestamp.to_i/1000).to_s).beginning_of_day + 1
  end
end