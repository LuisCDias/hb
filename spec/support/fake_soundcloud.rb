require 'sinatra/base'

class FakeSoundcloud < Sinatra::Base
  get '/connect' do
    json_response 200, 'soundcloud_access_token.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
