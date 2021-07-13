class Measured < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  validates_presence_of :value

  scope :created_before, ->(time) { where("created_at < ?", time) if time.present? }
  scope :with_measurement_id, ->(measurement_ids) {
    where(measurement_id: [*measurement_ids])
  }
end
