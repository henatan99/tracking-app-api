class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  # scope :overlaps, ->(day_one, day_last) do
  #   where "(DATEDIFF(start_date, ?) * DATEDIFF(?, end_date)) >= 0", end_date, start_date
  # end
  def self.goals_measurement_ids(user)
    user.goals.pluck(:measurement_id).uniq
  end

  validates_presence_of :quantity, :day_one, :day_last
  validates_uniqueness_of :measurement_id, :scope => [:user_id]
end
