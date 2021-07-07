require 'rails_helper'

RSpec.describe Measured, type: :model do
  # Association test
  # ensure Measured model belongs to user
  it { should belong_to(:user) }
  # ensure Measured model belongs to user
  it { should belong_to(:measurement) }
  # Validation test
  # ensure column name and unit are present before save
  it { should validate_presence_of(:value) }
end
