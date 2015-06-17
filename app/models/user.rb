class User < ActiveRecord::Base
  
  has_many :jobs
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_formatting_of :email
  
end
