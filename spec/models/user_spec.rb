require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do

    context "正常なユーザー登録" do
      let(:user){ FactoryBot.build(:user) }
      it "userが登録できること" do
        expect(user).to be_valid
      end
    end

    context "名前がないとき" do
      let(:user){ FactoryBot.build(:user, name: "") }
      it "エラーとなる" do
        user.valid?
        expect(user.errors[:name]).to include('名前は必須です')
      end
    end
    context "名前が12文字のとき" do
      let(:user){ FactoryBot.build(:user, name: "123456789012") }
      it "登録可能" do
        expect(user).to be_valid
      end
    end

    context "名前が13文字以上のとき" do
      let(:user){ FactoryBot.build(:user, name: "1234567890123") }
      it "登録不可" do
        user.valid?
        expect(user.errors[:name]).to include('名前は12文字以内でお願いします')
      end
    end

    context "emailがuniqでない時は失敗する" do
      let!(:user){ FactoryBot.create(:user, email: "test@user.com") }
      let!(:user2){ FactoryBot.build(:user, email: "test@user.com") }

      it "登録不可" do
        user2.valid?
        expect(user2.errors[:email]).to include('メールアドレスが間違えているか、既に登録されています')
      end
    end

    context "emailの形式が間違えているとき" do
      let(:user){ FactoryBot.build(:user, email: "test22@ff@user.cd.om") }

      it "登録不可" do
        user.valid?
        expect(user.errors[:email]).to include('メールアドレスが間違えているか、既に登録されています')
      end
    end

    context "emailが空のとき" do
      let(:user){ FactoryBot.build(:user, email: "") }

      it "登録不可" do
        user.valid?
        expect(user.errors[:email]).to include('メールアドレスは必須です')
      end
    end

    context "passwordが6文字のとき" do
      let(:user){ FactoryBot.build(:user, password: "123456") }

      it "登録可能" do
        expect(user).to be_valid
      end
    end

    context "passwordが5文字以下のとき" do
      let(:user){ FactoryBot.build(:user, password: "12345") }

      it "登録不可" do
        user.valid?
        expect(user.errors[:password]).to include('パスワードは6文字以上でお願いします')
      end
    end

  end
end
