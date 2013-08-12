require 'spec_helper'

feature 'A visitor can sign up' do
  scenario 'with an email address and a password' do
    sign_up_with 'user@example.com', 'example_pass'

    expect(page).
      to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'with a Facebook account' do
    sign_up_with_auth_provider :facebook

    expect(page).
      to have_content 'Successfully authenticated from Facebook account.'
  end
end
