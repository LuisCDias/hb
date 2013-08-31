RSpec.configure do |config|
  config.before(:each) do
   stub_request(
    :get,
    'http://soundcloud/connect?client_id=client_id').
    to_rack(FakeSoundcloud)

    stub_request(
      :get,
      'https://api.soundcloud.com/tracks/?format=json&oauth_token=1-412-14-21').
      to_rack(FakeSoundcloud)

    stub_request(
      :get,
      'https://api.soundcloud.com/me?format=json&oauth_token=1-412-14-21').
      to_rack(FakeSoundcloud)
  end
end
