require 'spec_helper'

feature 'User filters campaigns by category' do
  scenario 'to view only campaigns for a specific category' do
    user = create :user
    musician = create :musician, user: user
    create :soundcloud_account, musician: musician
    category = create :category, name: 'Minimal'
    other_category = create :category, name: 'Electro'
    campaign = create :campaign, musician: musician, category: category
    second_campaign = create(
      :campaign,
      name: 'Second Campaign',
      musician: musician,
      category: other_category
    )
    create :local_track, campaign: campaign
    create :local_track, campaign: second_campaign

    fan = create :user
    sign_in_as fan

    click_on 'Minimal'

    expect(page).not_to have_content second_campaign.name
  end
end
