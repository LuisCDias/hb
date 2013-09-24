require 'spec_helper'

describe Campaign, 'associations' do
  it { should belong_to(:musician) }
  it { should belong_to(:category) }
  it { should have_many(:backers).through(:reservations) }
  it { should have_many(:reservations).dependent(:destroy) }
  it { should have_one(:local_track).dependent(:destroy) }
end

describe Campaign, 'validations' do
  it { should validate_presence_of(:musician_name) }
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:requested_likes).only_integer }
  it { should validate_presence_of(:requested_likes) }
  it { should_not allow_value(0).for(:requested_likes) }
  it { should_not allow_value(26).for(:requested_likes) }
  it { should allow_value(25).for(:requested_likes) }
end
