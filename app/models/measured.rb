class Measured < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  validates_presence_of :value

  scope :order_by_date, -> { order(created_at: :desc) }
  scope :order_by_measurement_id, -> { order(measurement_id: :asc) }
end
