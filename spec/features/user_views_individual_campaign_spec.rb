require 'spec_helper'

feature 'User views a individual campaign' do
  scenario 'to find out more about the musician' do
    user = create :user
    musician = create :musician, user: user
    create :soundcloud_account, musician: musician
    category = create :category, name: 'Minimal'
    campaign = create :campaign, musician: musician, category: category
    create :local_track, campaign: campaign

    fan = create :user
    sign_in_as fan

    click_link campaign.name

    expect(page).to have_css 'h5', text: campaign.musician_name
  end
end
