require 'spec_helper'

describe Campaign, 'associations' do
  it { should belong_to(:category) }
  it { should have_many(:backers).through(:reservations) }
  it { should have_many(:reservations) }
end
