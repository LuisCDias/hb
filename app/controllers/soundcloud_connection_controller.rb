class SoundcloudConnectionController < AuthorizedController
  def connect
    redirect_to soundcloud_client.authorize_url(scope: 'non-expiring')
  end

  def connected
    if params[:error].nil?
      register_musician
      redirect_to user_settings_url,
         notice: 'Soundcloud account connected'
    else
      redirect_to user_settings_url,
        notice: 'Sorry, something went wrong'
    end
  end

  def disconnect
    if musician.destroy
      redirect_to user_settings_url,
        notice: 'Your Soundcloud account has been disconnected'
    else
      redirect_to user_settings_url,
        notice: 'Sorry, please try again later'
    end
  end

  private

  def code
    params[:code]
  end

  def credentials
    get_credentials
  end

  def get_credentials
    soundcloud_client.exchange_token code: code
  end

  def access_token
    credentials.access_token
  end

  def musician
    Musician.find params[:id]
  end

  def register_musician
    MusicianRegistration.new(access_token, current_user).register
  end

  def soundcloud_client
    @_soundcloud_client ||= SoundcloudGateway::SoundcloudClient.
      new(soundcloud_connected_url).client
  end
end
