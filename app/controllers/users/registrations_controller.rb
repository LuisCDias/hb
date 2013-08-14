class Users::RegistrationsController < Devise::RegistrationsController
  def resource_params
    params.require(:user).permit(
      :email,
      :name,
      :password,
      :password_confirmation
    )
  end
  private :resource_params
end
