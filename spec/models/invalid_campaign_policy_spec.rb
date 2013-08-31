require 'spec_helper'

describe InvalidCampaignPolicy do
  before do
    user = create :user
    access_token = "1-412-14-21"
    registration = MusicianRegistration.new access_token, user
    registration.register
    @campaign = create :campaign, musician: user.musician
  end

  it 'deletes invalid campaigns' do
    expect(InvalidCampaignPolicy.new(@campaign)).to receive(:sweep)
    @campaign.track_info = nil
  end

  it 'notifies the musician that the campaign is invalid'
end
