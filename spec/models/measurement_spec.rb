require 'rails_helper'

RSpec.describe Measurement, type: :model do
  # Association test
  # ensure Measurement model has a 1:m relationship with Measured model
  it { should have_many(:measureds) }
  # Validation test
  # ensure column name and unit are present before save
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:unit) }
end
