require 'spec_helper'

describe Campaign, 'associations' do
  it { should have_many(:backers).through(:reservations) }
  it { should have_many(:reservations) }
end
