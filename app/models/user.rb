class User < ApplicationRecord
  has_many :measureds, -> { order(created_by: :desc) }
  has_many :measurements, through: :measureds

  validates_presence_of :username
end
