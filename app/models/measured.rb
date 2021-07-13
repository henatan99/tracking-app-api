class Measured < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  validates_presence_of :value

  scope :created_before, ->(time) { where("created_at < ?", time) if time.present? }
end
