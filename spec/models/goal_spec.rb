require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:measurement) }

  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:day_one) }
  it { should validate_presence_of(:day_last) }
end
