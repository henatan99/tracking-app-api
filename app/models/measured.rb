class Measured < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  validates_presence_of :value

  scope :filter_by_date, ->(date) { where("created_at = ?", date) if date.present? }
  scope :filter_by_measurement_id, -> (measurement_id) { where measurement_id: measurement_id }
end
