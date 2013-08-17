require 'spec_helper'

describe Campaign, 'associations' do
  it { should belong_to(:musician) }
  it { should belong_to(:category) }
  it { should have_many(:backers).through(:reservations) }
  it { should have_many(:reservations) }
end

describe Campaign, 'validations' do
  it { should_not allow_value(52).for(:requested_likes) }
end

describe Campaign, 'built with musician' do
  it 'should not allow more than 50 requested likes' do
    user = create :user
    musician = create :musician, user: user
    campaign = musician.campaigns.build
    campaign.requested_likes = 52

    expect(campaign.save).to raise_error

  end
end
