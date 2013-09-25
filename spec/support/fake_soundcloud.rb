require 'sinatra/base'

class FakeSoundcloud < Sinatra::Base
  get '/connect' do
    json_response 200, 'soundcloud_access_token.json'
  end

  get '/me' do
    json_response 200, 'soundcloud_info.json'
  end

  get '/tracks/' do
    json_response 200, 'soundcloud_info.json'
  end

  get '/me/tracks' do
    json_response 200, 'artist_tracks.json'
  end

  get '/tracks/:track_id' do
    if params[:track_id] == '106359231'
      json_response 200, 'campaign_track_without_artwork.json'
    else
      json_response 200, 'campaign_track.json'
    end
  end

  put '/tracks/:track_id' do
    status 200
  end

  put '/users/:user_id' do
    status 200
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
