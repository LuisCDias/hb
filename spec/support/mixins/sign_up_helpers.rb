module SignUpHelpers
  def sign_up_with(email, password)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end

  def sign_up_with_auth_provider(auth_provider)
    visit user_omniauth_authorize_path auth_provider
  end
end

RSpec.configure do |config|
  config.include SignUpHelpers
end
