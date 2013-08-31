require 'spec_helper'

describe ArtistLounge, '#campaigns' do
  it 'returns an array of campaigns created of an artist'
end

describe ArtistLounge, '#campaign_count' do
  it 'returns the number of campaigns created by an artist'
end

describe ArtistLounge, '#soundcloud_avatar' do
  it 'returns the url for the soundcloud avatar of an artist'
end

describe ArtistLounge, '#soundcloud_followers' do
  it 'returns the number of soundcloud followers of an artist'
end

describe ArtistLounge, '#musician_description' do
  it 'returns the soundcloud bio of an artist'
end

describe ArtistLounge, '#download_counts' do
  it 'returns the total number of downloads for the campaigns of an artist'
end
