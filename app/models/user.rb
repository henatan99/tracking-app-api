# frozen_string_literal: true

class User < ApplicationRecord
  has_many :measureds, -> { order(created_at: :desc) }
  has_many :measurements, through: :measureds
  has_many :goals

  validates :username, presence: true, uniqueness: true
end
