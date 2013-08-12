require 'spec_helper'

describe Reservation, 'associations' do
  it { should belong_to(:campaign) }
  it { should belong_to(:user) }
end
