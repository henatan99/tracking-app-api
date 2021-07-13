class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :measurement
  
  validates_presence_of :quantity, :day_one, :day_last
end
