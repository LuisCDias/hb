require 'spec_helper'

describe MusicianRegistration do
  it 'creates a musician with a soundcloud account' do
    user = create :user
    access_token = "1-412-14-21"
    registration = MusicianRegistration.new access_token, user
    registration.register
  end
end
