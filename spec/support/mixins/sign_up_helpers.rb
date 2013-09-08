module SignUpHelpers
  def sign_up_as(name, email, password)
    visit root_path
    click_link 'Sign Up'

    within('.simple_form') do
      fill_in 'user_name', with: name
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'Sign up'
    end
  end

  def sign_up_with_auth_provider(auth_provider)
    visit user_omniauth_authorize_path auth_provider
  end

  def params
    attributes_for :user
  end
end

RSpec.configure do |config|
  config.include SignUpHelpers
end
