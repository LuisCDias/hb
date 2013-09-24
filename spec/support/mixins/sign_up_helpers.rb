module SignUpHelpers
  def sign_up_with(user_params)
    visit root_path
    click_link 'Sign Up'

    within('.simple_form') do
      fill_in 'user_name', with: user_params[:name]
      fill_in 'user_email', with: user_params[:email]
      fill_in 'user_password', with: user_params[:password]
      fill_in 'user_password_confirmation', with: user_params[:password]
      click_button 'Sign up'
    end
  end

  def sign_up_with_auth_provider(auth_provider)
    visit user_omniauth_authorize_path auth_provider
  end
end

RSpec.configure do |config|
  config.include SignUpHelpers
end
