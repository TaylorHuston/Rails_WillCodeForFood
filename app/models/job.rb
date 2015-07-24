class Job < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :company, presence: true
  validates :location, presence: true
  validates :url, presence: true, uniqueness: true
  validates_formatting_of :url
  validates :category, presence: true
  validates :description, presence: true
end
