require 'spec_helper'

feature 'Viewing the homepage a visitor' do

  before :each do
    visit root_path
  end

  scenario 'sees navigation to the music path' do
    within(".navbar-fixed-top") do
      expect(page).to have_css 'a', text: 'Music'
    end
  end

  scenario 'sees navigation to sign in' do
    within(".navbar-fixed-top") do
      expect(page).to have_css 'a', text: 'Sign In'
    end
  end

  scenario 'sees navigation to sign up' do
    within(".navbar-fixed-top") do
      expect(page).to have_css 'a', text: 'Sign Up'
    end
  end

  scenario 'does not see navigation to the launchbase path' do
    within(".navbar-fixed-top") do
      expect(page).not_to have_css 'a', text: 'launchbase'
    end
  end

  scenario 'does not see navigation to the user settings' do
    within(".navbar-fixed-top") do
      expect(page).not_to have_css 'a', text: 'Settings'
    end
  end
end
