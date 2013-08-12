module Concerns
  module DeviseRouting
    extend ActiveSupport::Concern

    included do
      protected

      def after_sign_in_path_for(resource)
        request.env['omniauth.origin'] || music_path
      end
    end
  end
end
