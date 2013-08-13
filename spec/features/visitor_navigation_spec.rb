require 'spec_helper'

feature 'Viewing the homepage a visitor' do
  scenario 'sees navigation to the music path' do
    visit root_path

    within(".navbar") do
      expect(page).to have_css 'a', text: 'Music'
    end
  end

  scenario 'sees navigation to login' do
    visit root_path

    within(".navbar") do
      expect(page).to have_css 'a', text: 'login'
    end
  end

  scenario 'does not see navigation to the launchbase path' do
    visit root_path

    within(".navbar") do
      expect(page).not_to have_css 'a', text: 'launchbase'
    end
  end

  scenario 'does not see navigation to the user settings' do
    visit root_path

    within(".navbar") do
      expect(page).not_to have_css 'a', text: 'Settings'
    end
  end
end
