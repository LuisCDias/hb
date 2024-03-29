require 'spec_helper'

feature 'User backs a campaign' do
  scenario 'by making a reservation' do
    user = create :user
    musician = create :musician, user: user
    create :soundcloud_account, musician: musician
    category = create :category, name: 'Minimal'
    campaign = create :campaign, musician: musician, category: category
    create :local_track, campaign: campaign

    fan = create :user

    sign_in_as fan

    click_on 'Launch this sound'

    expect(campaign.backers).to include fan
  end
end
