require 'spec_helper'

feature 'A visitor views the music path' do
  before do
    stub_request(:get, "http://api.soundcloud.com/tracks/?client_id=d8dd9c2a23717e16c48fcc5ce7f1a206&format=json").
           with(:headers => {'User-Agent'=>'SoundCloud Ruby Wrapper 0.3.1'}).
                    to_return(:status => 200, :body => "{artwork_url: 'string'}", :headers => {})
  end

  scenario 'and is prompted to sign up to back a campaign' do
    campaign = create :campaign

    visit music_path

    within("#campaign_#{campaign.id}") do
      click_button 'Make it launch faster'
    end

    expect(current_path).to eq new_user_session_path
  end
end
