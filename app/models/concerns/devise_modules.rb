module Concerns
  module DeviseModules
    extend ActiveSupport::Concern

    included do
      devise(
        :database_authenticatable,
        :omniauthable,
        :recoverable,
        :registerable,
        :rememberable,
        :trackable,
        :validatable
      )
    end
  end
end
