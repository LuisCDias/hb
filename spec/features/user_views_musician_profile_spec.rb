require 'spec_helper'

feature 'User views musician profile' do
  scenario 'to see how many launch requests a musician has achieved' do
    user = create :user
    musician = create :musician, user: user
    create :soundcloud_account, musician: musician
    category = create :category, name: 'Minimal'
    campaign = create :campaign, musician: musician, category: category
    create :local_track, campaign: campaign

    fan = create :user

    sign_in_as fan

    click_on campaign.artist_name

    expect(page).to have_content 'Stats Overview'
  end

  scenario 'to see how many campaigns a musician has launched' do
    user = create :user
    musician = create :musician, user: user
    create :soundcloud_account, musician: musician
    category = create :category, name: 'Minimal'
    campaign = create :campaign, musician: musician, category: category
    create :local_track, campaign: campaign

    fan = create :user

    sign_in_as fan

    click_on campaign.artist_name

    within(".overall-stats") do
      expect(page).to have_css '.campaign-count', text: 1
    end
  end
end
