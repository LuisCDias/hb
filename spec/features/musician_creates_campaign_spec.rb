require 'spec_helper'

feature 'Musician creates a campaign' do
  scenario 'with valid attributes' do
    user = create :user
    musician = create :musician, user: user
    create :soundcloud_account, musician: musician
    create :category, name: 'Minimal'
    sign_in_as user

    within(".nav") do
     click_link 'Artist Lounge'
    end

    create_valid_campaign

    expect(page).to have_content 'Campaign created'
  end

  scenario 'with invalid attributes' do
    user = create :user
    musician = create :musician, user: user
    create :soundcloud_account, musician: musician
    create :category, name: 'Minimal'
    sign_in_as user

    within(".nav") do
     click_link 'Artist Lounge'
    end

    create_invalid_campaign

    expect(current_path).to eq campaigns_path
  end
end
