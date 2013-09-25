require 'spec_helper'

feature 'Visitor views the music path' do
  scenario 'and is prompted to sign up to download a successful campaign' do
    user = create :user
    musician = create :musician, user: user
    create :soundcloud_account, musician: musician
    campaign = create :campaign, requested_likes: 1, musician: musician
    create :local_track, campaign: campaign
    fan = create :user
    create :reservation, campaign: campaign, user: fan

    visit music_path

    expect(page).to have_css 'a', text:
      'Sign in to Download'
  end
end
