require 'spec_helper'

feature 'Musician creates a campaign' do
  scenario 'for a soundcloud track' do
    user = create :user
    musician = create :musician, user: user
    create :soundcloud_account, musician: musician
    sign_in_as user

    within(".nav") do
     click_link 'Artist Lounge'
    end

    click_link 'New Campaign'

    fill_in 'Musician name', with: 'Zee artiste'
    fill_in 'Campaign name', with: 'Test campaign'
    select 'Minimal'
    fill_in 'Number of likes requested', with: 100
    select 'first'

    click_button 'Create campaign'

    expect(page).to have_content 'Campaign created'
  end
end
