require 'spec_helper'

describe Launchbase, '#reserved_campaigns' do
  it 'returns an array of campaigns reserved by a user' do
    user = create :user
    soundcloud_account = create :soundcloud_account
    musician = create :musician, soundcloud_account: soundcloud_account
    campaigns = create_list :campaign, 3, musician: musician

    campaigns.each do |campaign|
      create :reservation, campaign: campaign, user: user
    end

    expect(Launchbase.new(user).reserved_campaigns).to eq campaigns
  end
end

describe Launchbase, '#reservation_date' do
  it 'returns the reservation date for a reserved campaign' do
    user = create :user
    soundcloud_account = create :soundcloud_account
    musician = create :musician, soundcloud_account: soundcloud_account
    campaign = create :campaign, musician: musician
    reservation = create :reservation, campaign: campaign, user: user

    expect(
      Launchbase.new(user).reservation_date(campaign))
      .to eq reservation.created_at
  end
end

describe Launchbase, '#link_for_campaign' do
  it 'returns a url for the campaign track download' do
    user = create :user
    soundcloud_account = create :soundcloud_account
    musician = create :musician, soundcloud_account: soundcloud_account
    campaign = create :campaign, musician: musician
    create :local_track, campaign: campaign

    expect(
      Launchbase.new(user).link_for_campaign(campaign)
    ).to eq campaign.track_permalink
  end
end
