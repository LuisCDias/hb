require 'spec_helper'

describe Musician, 'associations' do
  it { should belong_to(:user) }
  it { should have_many(:campaigns) }
  it { should have_one(:soundcloud_account) }
end
