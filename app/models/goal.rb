class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :measurement
  
  validates_presence_of :quantity, :day_last, :day_last
end
