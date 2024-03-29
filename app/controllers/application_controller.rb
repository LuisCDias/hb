class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  include Concerns::DeviseRouting

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
        :email,
        :name,
        :password,
        :password_confirmation
      )
    end
  end
end
