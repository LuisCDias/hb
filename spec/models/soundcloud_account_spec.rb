require 'spec_helper'

describe SoundcloudAccount, 'associations' do
  it { should belong_to(:musician) }
end
