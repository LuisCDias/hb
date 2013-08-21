class SoundcloudConnectionController < AuthorizedController
  def connect
    redirect_to soundcloud_client.authorize_url(scope: 'non-expiring')
  end

  def connected
    if params[:error].nil?
      code = params[:code]
      credentials = soundcloud_client.exchange_token(code: code)
      user_client = Soundcloud.new(access_token: credentials.access_token)
       user_info = user_client.get("/me")

       musician = current_user.build_musician

       soundcloud_account = musician.build_soundcloud_account(
        access_token: credentials.access_token,
        refresh_token: credentials.refresh_token,
        token_expires: credentials.expires_in,
        soundcloud_uid: user_info.id,
        soundcloud_username: user_info.username,
        soundcloud_avatar: user_info.avatar_url,
        soundcloud_profile: user_info.permalink_url
       )
       soundcloud_account.save
       musician.save

       redirect_to user_settings_url, notice: 'Soundcloud account connected'
    else
      redirect_to user_settings_url, notice: 'Sorry, something went wrong'
    end
  end

  def disconnect
    musician = Musician.find(params[:id])
    if musician.destroy
      redirect_to user_settings_url, notice: 'Your Soundcloud account has been disconnected'
    else
      redirect_to user_settings_url, notice: 'Sorry, please try again later'
    end
  end

  private

  def soundcloud_client
    @soundcloud_client ||= Soundcloud.new(
      client_id: ENV['SC_STAGING_ID'],
      client_secret: ENV['SC_STAGING_SECRET'],
      redirect_uri: soundcloud_connected_url
    )
  end
end
