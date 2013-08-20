RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, 'http://soundcloud/connect?client_id=client_id').to_rack(FakeSoundcloud)
  end
end
