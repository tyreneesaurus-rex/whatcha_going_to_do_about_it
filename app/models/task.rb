class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true


  default_scope { order("priority ASC") }
end
