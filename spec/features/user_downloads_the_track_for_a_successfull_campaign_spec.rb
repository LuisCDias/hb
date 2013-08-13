require 'spec_helper'

feature 'User visits the launchbase to' do
  scenario 'download the track for a backed campaign' do
    user = create :user
    campaign = create :campaign
    create :reservation, user: user, campaign: campaign

    sign_in_as user

    visit launchbase_path

    expect(page).to have_css 'a', text: 'Download the full track'
  end
end
