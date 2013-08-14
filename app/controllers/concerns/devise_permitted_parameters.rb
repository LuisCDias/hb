module Concerns
  module DevisePermittedParameters
    extend ActiveSupport::Concern

    included do
      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) << :name
      end
    end
  end
end
