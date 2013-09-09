require 'spec_helper'

describe SignupNotification do
  it 'emails a notification to the user confirming signup' do
    user_params = attributes_for :user

    expect(UserMailer).to receive(:signup_confirmation)
    create :user, user_params
  end
end
