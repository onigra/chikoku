# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  twitter_id :integer          not null
#  name       :string(255)      not null
#  image      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe User do
  describe ".find_or_create" do
    let(:auth_hash) do
      {
        "provider" => "twitter",
        "uid" => "301244995",
        "info" => {
          "nickname" => "nekogeruge_987",
          "name" => "人生",
          "location" => "布団",
          "image" => "http://pbs.twimg.com/profile_images/378800000057979446/39eb8dbe5c61459b6bc1377f54587c52_normal.jpeg",
          "description" => "",
          "urls" => {
            "Website" => "http://t.co/YQ5qLe0Vgo",
            "Twitter" => "https://twitter.com/nekogeruge_987"
          }
        },
        "credentials" => {
          "token" => "1234567",
          "secret" => "abcdefg"
        },
        "extra" => {
          "access_token" => "opqrstu",
          "raw_info" => {
            "id" => 301244995,
            "id_str" => "301244995",
            "name" => "人生",
            "screen_name" => "nekogeruge_987",
            "location" => "布団",
            "profile_location" => nil,
            "description" => "",
            "url" => "http://t.co/YQ5qLe0Vgo",
            "entities" => {
              "url" => {
                "urls" => [
                  {
                    "url" => "http://t.co/YQ5qLe0Vgo",
                    "expanded_url" => "http://onigra.github.io/",
                    "display_url" => "onigra.github.io",
                    "indices" => [0, 22]
                  }
                ]
              },
              "description" => {
                "urls" => []
              }
            },
            "protected" => false,
            "followers_count" => 276,
            "friends_count" => 289,
            "listed_count" => 17,
            "created_at" => "Thu May 19 04:10:31 +0000 2011",
            "favourites_count" => 3503,
            "utc_offset" => 32400,
            "time_zone" => "Tokyo",
            "geo_enabled" => false,
            "verified" => false,
            "statuses_count" => 12949,
            "lang" => "ja",
            "contributors_enabled" => false,
            "is_translator" => false,
            "is_translation_enabled" => false,
            "profile_background_color" => "EDECE9",
            "profile_background_image_url" => "http://abs.twimg.com/images/themes/theme3/bg.gif",
            "profile_background_image_url_https" => "https://abs.twimg.com/images/themes/theme3/bg.gif",
            "profile_background_tile" => false,
            "profile_image_url" => "http://pbs.twimg.com/profile_images/378800000057979446/39eb8dbe5c61459b6bc1377f54587c52_normal.jpeg",
            "profile_image_url_https" => "https://pbs.twimg.com/profile_images/378800000057979446/39eb8dbe5c61459b6bc1377f54587c52_normal.jpeg",
            "profile_link_color" => "181A19",
            "profile_sidebar_border_color" => "D3D2CF",
            "profile_sidebar_fill_color" => "E3E2DE",
            "profile_text_color" => "634047",
            "profile_use_background_image" => true,
            "default_profile" => false,
            "default_profile_image" => false,
            "following" => false,
            "follow_request_sent" => false,
            "notifications" => false
          }
        }
      }
    end

    context "ユーザーが存在する" do
      let(:user) { FactoryGirl.create :nekogeruge }
      subject { User.find_or_create auth_hash }

      it "存在しているユーザーのオブジェクトが取得できる" do
        should eq user
      end
    end

    context "ユーザーが存在しない" do
      subject { User.find_or_create auth_hash }

      it "新規ユーザーが作成される" do
        subject.reload

        expect(User.count).to eq 1
        expect(subject.twitter_id).to eq 301244995
        expect(subject.name).to eq "nekogeruge_987"
        expect(subject.image).to eq "http://pbs.twimg.com/profile_images/378800000057979446/39eb8dbe5c61459b6bc1377f54587c52_normal.jpeg"
      end
    end
  end
end
