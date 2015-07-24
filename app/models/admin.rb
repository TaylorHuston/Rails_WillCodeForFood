class Admin < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_formatting_of :email

end
