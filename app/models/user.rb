class User < ActiveRecord::Base
  include Concerns::DeviseModules

  after_create :sendmail

  has_many :reservations, dependent: :destroy
  has_many :campaigns, through: :reservations
  has_one :musician, dependent: :destroy
  has_one :soundcloud_account, through: :musician

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

  def musician?
    true unless musician == nil
  end

  def reserved_campaigns
    campaigns
  end

  def sendmail
    UserMailer.signup_confirmation(self).deliver
  end
end
