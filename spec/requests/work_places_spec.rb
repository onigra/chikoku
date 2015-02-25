require 'rails_helper'

describe "WorkPlaces", type: :request do
  describe "GET /work_places/new" do
    context "ログイン時" do
      context "作成済" do
        let(:user) { FG.create :nekogeruge }

        before { user }

        it "editにリダイレクト" do
          login
          get work_places_new_path
          expect(response).to redirect_to work_places_edit_path
        end
      end

      context "未作成" do
        it "return 302" do
          get work_places_new_path
          expect(response).to have_http_status 302
        end
      end
    end

    context "未ログイン" do
      it "トップにリダイレクト" do
        get work_places_new_path
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "GET /work_places/edit" do
    context "ログイン時" do
      context "作成済" do
        let(:user) { FG.create :nekogeruge }

        before { user }

        it "return 200" do
          login
          get work_places_edit_path
          expect(response).to have_http_status 200
        end
      end

      context "未作成" do
        let(:user) { FG.create :has_not_create_destination }

        before { user }

        it "newにリダイレクト" do
          login
          get work_places_edit_path
          expect(response).to redirect_to work_places_new_path
        end
      end
    end

    context "未ログイン" do
      it "トップにリダイレクト" do
        get work_places_edit_path
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "POST /work_places" do
    context "ログイン時" do
      context "出勤先未作成" do
        let(:user) { FG.create :has_not_create_destination }
        let(:param) { FG.attributes_for :gotanda }

        before { user }

        it "トップにリダイレクトし、勤務地が作成される" do
          login
          post work_places_path({ work_place: param })

          expect(response).to redirect_to root_path
          expect(user.work_place.destination).to eq param[:destination]
          expect(user.work_place.hour).to eq param[:hour]
          expect(user.work_place.min).to eq param[:min]
        end
      end

      context "出勤先作成済" do
        let(:user) { FG.create :nekogeruge }
        let(:param) { FG.attributes_for :mejiro }

        before { user }

        it "一意性制約エラー" do
          login
          expect { post work_places_path({ work_place: param }) }.to raise_error ActiveRecord::RecordNotUnique
        end
      end
    end

    context "未ログイン" do
      let(:param) { FG.attributes_for :mejiro }

      it "トップにリダイレクト" do
        post work_places_path({ work_place: param })
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "PATCH /work_places" do
    context "ログイン時" do
      context "出勤先未作成" do
        let(:user) { FG.create :has_not_create_destination }
        let(:param) { FG.attributes_for :gotanda }

        before { user }

        it "updateメソッドが無くてエラー" do
          login
          expect { patch work_places_path({ work_place: param }) }.to raise_error NoMethodError
        end
      end

      context "出勤先作成済" do
        let(:user) { FG.create :nekogeruge }
        let(:param) { FG.attributes_for :mejiro }

        before { user }

        it "トップにリダイレクトし、勤務地が更新される" do
          login
          patch work_places_path({ work_place: param })

          expect(response).to redirect_to root_path
          expect(user.work_place.destination).to eq param[:destination]
          expect(user.work_place.hour).to eq param[:hour]
          expect(user.work_place.min).to eq param[:min]
        end
      end
    end

    context "未ログイン" do
      let(:param) { FG.attributes_for :mejiro }

      it "トップにリダイレクト" do
        patch work_places_path({ work_place: param })
        expect(response).to redirect_to root_path
      end
    end
  end
end
