require 'spec_helper'

describe InvalidCampaignPolicy do
  it 'deletes invalid campaigns' do
    campaign = double('campaign').as_null_object
    expect(campaign).to receive(:destroy)

    InvalidCampaignPolicy.new(campaign).sweep
  end

  it 'notifies the musician that the campaign is invalid' do
    musician = double('musician', email: 'artist@example.com')
    campaign = double('campaign', musician: musician).as_null_object
    expect(UserMailer).to receive(:campaign_deleted).with(
      musician.email, campaign).
      and_return( double('Mailer', deliver: true))

    InvalidCampaignPolicy.new(campaign).sweep
  end
end
