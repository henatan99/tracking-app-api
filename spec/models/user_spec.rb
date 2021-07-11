require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with Measured model
  it { should have_many(:measureds) }
  # Validation test
  # ensure column username is present before save
  it { should validate_presence_of(:username) }
  # ensure User model has a 1:, relationship with Measurement model through Measured
  it { should have_many(:measurements).through(:measureds) }
end
