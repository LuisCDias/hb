class User < ActiveRecord::Base
  include Concerns::DeviseModules

  has_one :musician
  has_one :soundcloud_account, through: :musician

  validates :auth_uid, uniqueness: true
  validates :name, presence: true

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
      avatar: auth_hash.info.image,
      auth_provider: auth_hash.provider,
      auth_uid: auth_hash.uid,
      email: auth_hash.info.email,
      name: auth_hash.info.name,
      password: Devise.friendly_token[0,20]
    )
  end
end
