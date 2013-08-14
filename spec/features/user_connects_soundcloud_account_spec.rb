require 'spec_helper'

feature 'User connects Soundcloud account' do
  scenario 'to become a musician' do
    user = create :user
    sign_in_as user

    visit user_settings_path

    click_link 'Connect your Soundcloud account'

    expect(page).to have_content 'Soundcloud account connected'
  end
end
