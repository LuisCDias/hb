require 'spec_helper'

feature 'Musician deletes a campaign' do
  scenario 'visiting the artist lounge' do
    user = create :user
    musician = create :musician, user: user
    create :soundcloud_account, musician: musician
    category = create :category, name: 'Minimal'
    campaign = create :campaign, musician: musician, category: category
    create :local_track, campaign: campaign

    sign_in_as user
    visit artist_lounge_path

    click_on 'Delete'

    expect(page).to have_content 'Campaign deleted'
  end
end
