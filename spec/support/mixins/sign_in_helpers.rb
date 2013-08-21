module SignInHelpers
  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'login'
  end

  def sign_in_with(oauth_provider)
    visit user_omniauth_authorize_path oauth_provider
  end
end

RSpec.configure do |config|
  config.include SignInHelpers
end
