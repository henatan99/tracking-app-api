# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Measured, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:measurement) }

  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:measurement_id) }
end
