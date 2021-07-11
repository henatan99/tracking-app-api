class Measured < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  validates_presence_of :value
end
