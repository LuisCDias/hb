require 'spec_helper'

feature 'A logged in user' do
  scenario 'sees navigation to the launchbase path' do
    user = create :user
    sign_in_as user

    within(".navbar") do
      expect(page).to have_css 'a', text: 'Launchbase'
    end
  end
end
