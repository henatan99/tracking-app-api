class Measurement < ApplicationRecord
  has_many :measureds

  validates_presence_of :name
  validates_presence_of :unit
end
