class Measured < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  validates_presence_of :value

  scope :filter_by_date, ->(date) { where("created_at = ?", date) if date.present? }
  # scope :filter_by_measurement_id, -> (measurement_id) { where measurement_id: measurement_id }
  scope :by_measurement, lambda { |measurement|
    where(:measurement_id => measurement)
  }

  scope :order_by_date, -> { order(created_at: :desc) }

  def self.measureds_dates(user)
    plucked_dates = user.measureds.order_by_date.pluck(:created_at[date]).uniq
  end
end
