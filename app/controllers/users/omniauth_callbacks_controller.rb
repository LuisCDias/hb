class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_or_create_from_auth_hash auth_hash
    sign_in_and_redirect @user
    set_flash_message(:notice, :success, kind: 'Facebook')
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
