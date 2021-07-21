class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  validates_presence_of :quantity, :day_one, :day_last
  # validates_uniqueness_of :measurement_id, :scope => [:user_id]
end
