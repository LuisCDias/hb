module SignInHelpers
  def sign_in_as(user)
    visit root_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Sign in'
  end

  def sign_in_with(oauth_provider)
    visit user_omniauth_authorize_path oauth_provider
  end
end

RSpec.configure do |config|
  config.include SignInHelpers
end
