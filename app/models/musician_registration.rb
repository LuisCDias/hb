class MusicianRegistration
  def initialize(access_token, user)
    @access_token = access_token
    @user = user
  end

  def register
    create_musician_with_soundcloud_account
  end

  private

  attr_reader :access_token, :user

  def create_musician_with_soundcloud_account
    musician.create_soundcloud_account(access_token: access_token).
      sync_with_soundcloud
  end

  def musician
    user.create_musician
  end
end
