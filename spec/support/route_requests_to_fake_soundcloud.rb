RSpec.configure do |config|
  config.before(:each) do
    stub_request(
      :get,
      'http://soundcloud/connect?client_id=client_id').
      to_rack(FakeSoundcloud)
    stub_request(
      :get,
      "https://api.soundcloud.com/tracks/?format=json&oauth_token=access_token").
      to_return()
  end
end
