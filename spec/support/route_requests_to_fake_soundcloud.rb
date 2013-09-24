RSpec.configure do |config|
  config.before(:each) do
   stub_request(
    :get,
    'http://soundcloud/connect?client_id=client_id').
    to_rack(FakeSoundcloud)

    stub_request(
      :get,
      'https://api.soundcloud.com/tracks/?format=json&oauth_token=access_token').
      to_rack(FakeSoundcloud)

    stub_request(
      :get,
      'https://api.soundcloud.com/me?format=json&oauth_token=access_token').
      to_rack(FakeSoundcloud)

    stub_request(
      :get,
      'https://api.soundcloud.com/me/tracks?format=json&oauth_token=access_token').
       to_rack(FakeSoundcloud)

    stub_request(
      :get,
      "http://api.soundcloud.com/tracks/106359230?client_id=#{ENV['SC_CLIENT_ID']}&format=json").
       to_rack(FakeSoundcloud)

    stub_request(
      :get,
      'https://api.soundcloud.com/tracks/106359230?format=json&oauth_token=access_token').
      to_rack(FakeSoundcloud)

   stub_request(
    :get,
    "http://api.soundcloud.com/tracks/?client_id=#{ENV['SC_CLIENT_ID']}&format=json").
    to_rack(FakeSoundcloud)

    stub_request(
      :put,
      "https://api.soundcloud.com/tracks/106359230").
       to_rack(FakeSoundcloud)

    stub_request(
      :put,
      "https://api.soundcloud.com/users/47808088").
       to_rack(FakeSoundcloud)
  end
end
