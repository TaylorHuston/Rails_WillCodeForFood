class Job < ActiveRecord::Base
  validates :title, presence: true
  validates :company, presence: true
  validates :url, presence: true, uniqueness: true
  validates :category, presence: true
  validates :description, presence: true
end
