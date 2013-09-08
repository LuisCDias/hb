require 'spec_helper'

describe SuccessfulCampaignPolicy do
  it 'sets the campaign track as downloadable on Soundcloud' do
    campaign = double('campaign').as_null_object

    expect(SoundcloudGateway::TrackMetadataUpdater).to receive(:new).
      with(campaign)

    SuccessfulCampaignPolicy.new(campaign).process
  end
  it 'notifies the campaign backers that the campaign is available for download'
  it 'notifies the musician that the campaign has been successfuly launched'
end
