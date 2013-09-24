require 'spec_helper'

describe User, 'associations' do
  it { should have_one(:musician) }
  it { should have_one(:soundcloud_account).through(:musician) }
end

describe User, 'validations' do
  it { should validate_presence_of(:name) }
end
