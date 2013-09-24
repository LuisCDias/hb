require 'spec_helper'

describe ArtistLounge, '#campaigns' do
  it 'returns an array campaigns created by an artist' do
    artist = double('artist', campaigns: [])

    expect(ArtistLounge.new(artist).campaigns).to eq []
  end
end

describe ArtistLounge, '#campaign_count' do
  it 'returns the total of campaigns created by an artist' do
    artist = double(
      'artist',
      campaigns: [ double('campaign_one'), double('campaign_two')]
    )

    expect(ArtistLounge.new(artist).campaign_count).to eq 2
  end
end

describe ArtistLounge, '#soundcloud_avatar' do
  it 'returns the soundcloud avatar url for an artist' do
    artist = double('artist', soundcloud_avatar: 'avatar_url')

    expect(ArtistLounge.new(artist).soundcloud_avatar).to eq 'avatar_url'
  end
end

describe ArtistLounge, '#soundcloud_followers' do
  it 'returns the number of soundcloud followers for an artist' do
    artist = double('artist', soundcloud_followers_count: 1)

    expect(ArtistLounge.new(artist).soundcloud_followers).to eq 1
  end
end

describe ArtistLounge, '#musician_description' do
  it 'returns the description for an artist' do
    artist = double('artist', description: 'Cool dude')

    expect(ArtistLounge.new(artist).musician_description).to eq 'Cool dude'
  end
end

describe ArtistLounge, '#total_campaign_download_count' do
  it 'returns the download count for all artist campaigns' do
    artist = double('artist', total_campaign_download_count: 1)

    expect(ArtistLounge.new(artist).download_counts).to eq 1
  end
end

describe ArtistLounge, '#total_campaign_download_count' do
  it 'returns the playcount for all artist campaigns' do
    artist = double('artist', total_campaign_playcount: 1)

    expect(ArtistLounge.new(artist).playcount).to eq 1
  end
end
