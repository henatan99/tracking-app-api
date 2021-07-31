class Measurement < ApplicationRecord
  has_many :measureds
  has_many :goals

  validates_presence_of :name
  validates_presence_of :unit
end
