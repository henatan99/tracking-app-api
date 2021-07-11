class User < ApplicationRecord
  has_many :measureds
  has_many :measurements, through: :measureds

  validates_presence_of :username
end
