require 'spec_helper'

describe TrackInfo, '#track_artwork' do
  context 'if track has artwork on soundcloud' do
    it 'returns the artwork url for a track' do
      musician = create :musician
      campaign = create :campaign, musician: musician
      artwork_url = 
        "https://i1.sndcdn.com/artworks-000055800838-shdhnw-t200x200.jpg?3eddc42"

      expect(TrackInfo.new(campaign.track_id).track_artwork).
        to eq artwork_url
    end
  end

  context 'if track does not have artwork on soundcloud' do
    it 'returns a default artwork url' do
      musician = create :musician
      campaign = create :campaign, musician: musician, track_id: 106359231
      default_artwork_url = 
        "https://i1.sndcdn.com/artworks-000055452316-se7lpm-t200x200.jpg?aa1a7cb"

      expect(TrackInfo.new(campaign.track_id).track_artwork).
        to eq default_artwork_url
    end
  end
end
