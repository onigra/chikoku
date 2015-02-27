require 'rails_helper'

RSpec.describe "SlackNotifications", type: :request do
  describe "GET /slack/new" do
    context "ログイン時" do
      context "作成済" do
        let(:user) { FG.create :nekogeruge }

        before { user }

        it "editにリダイレクト" do
          login
          get slack_new_path
          expect(response).to redirect_to slack_edit_path
        end
      end

      context "未作成" do
        let(:user) { FG.create :has_not_create_destination }

        before { user }

        it "return 200" do
          login
          get slack_new_path
          expect(response).to have_http_status 200
        end
      end
    end

    context "未ログイン" do
      it "トップにリダイレクト" do
        get slack_new_path
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "GET /slack/edit" do
    context "ログイン時" do
      context "作成済" do
        let(:user) { FG.create :nekogeruge }

        before { user }

        it "return 200" do
          login
          get slack_edit_path
          expect(response).to have_http_status 200
        end
      end

      context "未作成" do
        let(:user) { FG.create :has_not_create_destination }

        before { user }

        it "newにリダイレクト" do
          login
          get slack_edit_path
          expect(response).to redirect_to slack_new_path
        end
      end
    end

    context "未ログイン" do
      it "トップにリダイレクト" do
        get slack_edit_path
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "POST /slack" do
    context "ログイン時" do
      context "出勤先未作成" do
        let(:user) { FG.create :has_not_create_destination }
        let(:param) { FG.attributes_for :chikoku }

        before { user }

        it "トップにリダイレクトし、勤務地が作成される" do
          login
          post slack_path({ slack_notification: param })

          expect(response).to redirect_to root_path
          expect(user.slack_notification.request_url).to eq param[:request_url]
          expect(user.slack_notification.slack_name).to eq param[:slack_name]
          expect(user.slack_notification.emoji).to eq param[:emoji]
          expect(user.slack_notification.message).to eq param[:message]
        end
      end

      context "出勤先作成済" do
        let(:user) { FG.create :nekogeruge }
        let(:param) { FG.attributes_for :chikoku }

        before { user }

        it "一意性制約エラー" do
          login
          expect { post slack_path({ slack_notification: param }) }.to raise_error ActiveRecord::RecordNotUnique
        end
      end
    end

    context "未ログイン" do
      let(:param) { FG.attributes_for :chikoku }

      it "トップにリダイレクト" do
        post slack_path({ slack_notification: param })
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "PATCH /slack" do
    context "ログイン時" do
      context "出勤先未作成" do
        let(:user) { FG.create :has_not_create_destination }
        let(:param) { FG.attributes_for :slack_update }

        before { user }

        it "updateメソッドが無くてエラー" do
          login
          expect { patch slack_path({ slack_notification: param }) }.to raise_error NoMethodError
        end
      end

      context "出勤先作成済" do
        let(:user) { FG.create :nekogeruge }
        let(:param) { FG.attributes_for :slack_update }

        before { user }

        it "トップにリダイレクトし、勤務地が更新される" do
          login
          patch slack_path({ slack_notification: param })

          expect(response).to redirect_to root_path
          expect(user.slack_notification.request_url).to eq param[:request_url]
          expect(user.slack_notification.slack_name).to eq param[:slack_name]
          expect(user.slack_notification.emoji).to eq param[:emoji]
          expect(user.slack_notification.message).to eq param[:message]
        end
      end
    end

    context "未ログイン" do
      let(:param) { FG.attributes_for :mejiro }

      it "トップにリダイレクト" do
        patch slack_path({ slack_notification: param })
        expect(response).to redirect_to root_path
      end
    end
  end
end
