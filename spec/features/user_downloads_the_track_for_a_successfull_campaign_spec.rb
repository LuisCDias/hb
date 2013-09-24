require 'spec_helper'

feature 'User visits the launchbase to' do
  before do
    user = create :user
    access_token = "access_token"
    registration = MusicianRegistration.new access_token, user
    registration.register
    @campaign = create :campaign, musician: user.musician, requested_likes: 1
    local_track = create :local_track
    @campaign.local_track = local_track

  end

  scenario 'download the track for a backed campaign' do
    user = create :user
    create :reservation, user: user, campaign: @campaign

    sign_in_as user

    visit launchbase_path

    expect(page).to have_css 'a', text: 'Download Track'
  end
end
