class User < ApplicationRecord
    has_many :measureds
    has_many :measurements, through: :measureds

    validate_presence_of :username
end
