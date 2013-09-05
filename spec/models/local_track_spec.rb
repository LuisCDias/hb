require 'spec_helper'

describe LocalTrack, 'associations' do
  it { should belong_to(:campaign) }
end
