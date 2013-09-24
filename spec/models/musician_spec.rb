require 'spec_helper'

describe Musician, 'associations' do
  it { should belong_to(:user) }
  it { should have_many(:campaigns).dependent(:destroy) }
  it { should have_one(:soundcloud_account).dependent(:destroy) }
end

describe Musician, '#campaign_count' do
  it 'returns the number of campaigns created by the musician' do
    musician = create :musician
    create_list :campaign, 2, musician: musician

    expect(musician.campaign_count).to eq 2
  end
end

describe Musician, '#description' do
  it 'returns the soundcloud profile description for the musician' do
    musician = create :musician
    create :soundcloud_account, musician: musician
    description = nil

    expect(musician.description).to eq description
  end
end

describe Musician, '#soundcloud_followers_count' do
  it 'returns the number of followers a user has on soundcloud' do
    musician = create :musician
    create :soundcloud_account, musician: musician
    follower_count = 0

    expect(musician.soundcloud_followers_count).to eq follower_count
  end
end

describe Musician, '#total_campaign_download_count' do
  it "returns the number of downloads for the musician's campaigns" do
    musician = create :musician
    create :soundcloud_account, musician: musician
    campaign = create :campaign, musician: musician
    download_count = campaign.download_count

    expect(musician.total_campaign_download_count).to eq download_count
  end
end

describe Musician, '#total_campaign_playcount' do
  it "returns the number of downloads for the musician's campaigns" do
    musician = create :musician
    create :soundcloud_account, musician: musician
    campaign = create :campaign, musician: musician
    playcount = campaign.playcount

    expect(musician.total_campaign_playcount).to eq playcount
  end
end

describe Musician, '#total_launch_requests_achieved' do
  it "returns the number of reservations for the musician's campaigns" do
    musician = create :musician
    campaigns = create_list :campaign, 2, musician: musician
    campaigns.each { |campaign| create :reservation, campaign: campaign }

    expect(musician.total_launch_requests_achieved).to eq 2
  end
end

describe Musician, '#tracks' do
  it "returns the tracks from the musician's soundcloud account" do
    musician = create :musician
    create :soundcloud_account, musician: musician
    musician_track_count = 2

    expect(musician.tracks.length).to eq musician_track_count
  end
end
