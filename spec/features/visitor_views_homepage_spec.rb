require 'spec_helper'

feature 'A visitor views the homepage' do
  scenario 'to find information about the app' do
    visit root_path
    expect(page).to have_css 'h1', text: 'launch dance music today'
  end
end
