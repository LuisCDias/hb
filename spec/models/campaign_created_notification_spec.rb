require 'spec_helper'

describe CampaignCreatedNotification do
  it 'notifies a musician that a campaign has been successfuly created' do
    campaign_params = attributes_for :campaign
    musician = double('musician')
    expect(UserMailer).to receive(:campaign_created).
      with(musician, campaign_params[:name])

    create :campaign, campaign_params, musician: musician
  end
end
