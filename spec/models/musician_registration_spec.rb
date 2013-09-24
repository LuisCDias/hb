require 'spec_helper'

describe MusicianRegistration do
  it 'creates a musician with a soundcloud account' do
    user = create :user, musician: false
    access_token = "access_token"
    registration = MusicianRegistration.new access_token, user
    registration.register

    expect(user.musician?).to be true
  end
end
