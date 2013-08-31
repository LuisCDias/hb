require 'spec_helper'

describe SuccessfulCampaignPolicy do

  subject { SuccessfulCampaignPolicy.new(campaign).process }

  it 'sets the campaign track as downloadable on Soundcloud'
  it 'notifies the campaign backers that the campaign is available for download'
  it 'notifies the musician that the campaign has been successfuly launched'
end
