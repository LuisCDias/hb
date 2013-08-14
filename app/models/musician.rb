class Musician < ActiveRecord::Base
  belongs_to :user
  has_many :campaigns
  has_one :soundcloud_account

  def description
    musician_info.description
  end

  private

  def musician_info
    musician_client.get("/me")
  end

  def musician_client
    Soundcloud.new access_token: soundcloud_account.access_token
  end
end
