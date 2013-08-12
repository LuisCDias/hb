require 'spec_helper'

feature 'User is redirected to music path' do
  scenario 'after signing in with email and password' do
    user = create :user
    sign_in_as user

    expect(current_path).to eq music_path
  end

  scenario 'after signing in with a Facebook account' do
    sign_in_with :facebook

    expect(current_path).to eq music_path
  end
end
