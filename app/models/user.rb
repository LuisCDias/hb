class User < ActiveRecord::Base
  include Concerns::DeviseModules

  validates :auth_uid, uniqueness: true

  def self.find_or_create_from_auth_hash(auth_hash)
    find_by_auth_hash(auth_hash) || create_from_auth_hash(auth_hash)
  end

  def self.find_by_auth_hash(auth_hash)
    where(
      auth_provider: auth_hash.provider,
      auth_uid: auth_hash.uid
    ).first
  end

  def self.create_from_auth_hash(auth_hash)
    create(
      auth_provider: auth_hash.provider,
      auth_uid: auth_hash.uid,
      email: auth_hash.info.email,
      password: Devise.friendly_token[0,20]
    )
  end
end
