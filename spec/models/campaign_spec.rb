require 'spec_helper'

describe Campaign, 'associations' do
  it { should belong_to(:musician) }
  it { should belong_to(:category) }
  it { should have_many(:backers).through(:reservations) }
  it { should have_many(:reservations) }
end

describe Campaign, 'validations' do
  it { should validate_numericality_of(:requested_likes) }
end
