require 'spec_helper'

feature 'A visitor views the music path' do
  scenario 'and is prompted to sign up to back a campaign' do
    campaign = create :campaign

    visit music_path

    within("#campaign_#{campaign.id}") do
      click_button 'Make it launch faster'
    end

    expect(current_path).to eq new_user_session_path
  end
end
