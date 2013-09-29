require 'spec_helper'

describe SoundcloudGateway::SoundcloudClient, '#client' do
  it 'returns a new instance of Soundcloud Ruby client' do
    redirect_url = 'connect_soundcloud_path'

    expect(
      SoundcloudGateway::SoundcloudClient.new(redirect_url).
      client
    ).to be_an_instance_of Soundcloud::Client
  end

  it 'returns a Soundcloud client with the correct redirect_url for auth' do
    redirect_url = 'connect_soundcloud_path'

    expect(
      SoundcloudGateway::SoundcloudClient.new(redirect_url).
      client.redirect_uri
    ).to eq redirect_url
  end
end
