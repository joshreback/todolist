class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  
  has_many :categories, dependent: :destroy

  def active_categories
    categories.where("active is NOT false")
  end
end
