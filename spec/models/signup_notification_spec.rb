require 'spec_helper'

describe SignupNotification do
  it 'emails a notification to the user confirming signup' do

    expect(UserMailer).to receive(:signup_confirmation).
      and_return(double('Mailer', deliver: true))
    create :user
  end
end
