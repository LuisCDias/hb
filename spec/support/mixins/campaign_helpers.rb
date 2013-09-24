module CampaignHelpers
  def create_valid_campaign
    click_link 'New Campaign'

    fill_in 'Musician name', with: 'Zee artiste'
    fill_in 'Campaign name', with: 'Test campaign'
    select 'Minimal'
    select("Pete Tha Zouk - Tomorrow (Ovaal Remix)", from: 'campaign[track_id]')
    fill_in 'campaign[requested_likes]', with: 2
    click_on 'Create Campaign'
  end

  def create_invalid_campaign
    click_link 'New Campaign'

    fill_in 'Musician name', with: 'Zee artiste'
    fill_in 'Campaign name', with: 'Test campaign'
    select 'Minimal'
    select("Pete Tha Zouk - Tomorrow (Ovaal Remix)", from: 'campaign[track_id]')
    fill_in 'campaign[requested_likes]', with: 26
    click_on 'Create Campaign'
  end
end

RSpec.configure do |config|
  config.include CampaignHelpers
end
