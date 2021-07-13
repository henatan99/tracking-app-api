class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  validates_presence_of :day_one, :day_one
end
