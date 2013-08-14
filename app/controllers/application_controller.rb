class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  include Concerns::DeviseRouting
  include Concerns::DevisePermittedParameters
end
