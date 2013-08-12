require 'spec_helper'

feature 'A user can back a campaign' do
  scenario 'by making a reservation' do
    user = create :user
    campaign = create :campaign

    sign_in_as user

    within("#campaign_#{campaign.id}") do
      click_button 'Make it launch faster'
    end

    expect(campaign.backers).to include user
  end

  scenario 'only once' do
    user = create :user
    campaign = create :campaign
    create :reservation, user: user, campaign: campaign

    sign_in_as user

    within("#campaign_#{campaign.id}") do
      expect(page).to have_css 'button', text: 'Reserved'
    end
  end
end
