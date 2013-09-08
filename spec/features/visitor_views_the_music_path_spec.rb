require 'spec_helper'

feature 'A visitor views the music path' do
  scenario 'and is prompted to sign up to back a campaign' do
    visit music_path

    click_link 'Launch this sound'

    expect(current_path).to eq new_user_session_path
  end
end
