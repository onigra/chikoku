module AuthHelpers
  def login
    set_omniauth
    get '/auth/twitter'
    request.env['omniauth.env'] = OmniAuth.config.mock_auth[:twitter]
    get '/auth/twitter/callback'
  end

  def set_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :uid => '123545'
      })

    OmniAuth.config.add_mock(
      :twitter,
      {
        info: {
          nickname: "nekogeruge_987",
          image: "http://pbs.twimg.com/profile_images/378800000057979446/39eb8dbe5c61459b6bc1377f54587c52_normal.jpeg"
        },
        extra: {
          raw_info: {
            id: 301244995
          }
        }
      }
    )
  end
end
