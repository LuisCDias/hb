require 'spec_helper'

describe User, 'validations' do
  it { should validate_uniqueness_of(:auth_uid) }
end
