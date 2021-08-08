# frozen_string_literal: true

# Goal
class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  def self.goals_measurement_ids(user)
    user.goals.pluck(:measurement_id).uniq
  end

  validates_presence_of :quantity, :day_one, :day_last
  validates_uniqueness_of :measurement_id, scope: [:user_id]
end
