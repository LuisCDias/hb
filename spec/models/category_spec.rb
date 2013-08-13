require 'spec_helper'

describe Category, 'associations' do
  it { should have_many(:campaigns) }
end

describe Category, 'validations' do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
