require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it { should have_many(:measureds) }
  it { should have_many(:goals) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:unit) }
end
