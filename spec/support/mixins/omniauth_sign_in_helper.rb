module OmniauthSignInHelper
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    provider: 'facebook',
    uid: '1234567',
    info: {
      nickname: 'test_user',
      email: 'test_user@example.com',
      name: 'Test User'
    },
    credentials: {
      token: 'ABCDEF...',
      expires_at: 1234567,
      expires: true
    }
    })
end

RSpec.configure do |config|
  config.include OmniauthSignInHelper
end
