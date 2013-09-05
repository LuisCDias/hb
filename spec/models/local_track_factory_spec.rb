require 'spec_helper'

describe LocalTrackFactory do
  it "creates a local track for the passed in campaign" do
    campaign = double('campaign').as_null_object
    expect(campaign).to receive(:build_local_track)
    LocalTrackFactory.new(campaign).create
  end
end
