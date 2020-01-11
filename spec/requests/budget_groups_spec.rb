require 'rails_helper'

RSpec.describe "BudgetGroups", type: :request do

  describe "GET /budget_groups" do
    context "ログインユーザーがいない時" do
      it "リダイレクトされる" do
        get budget_groups_path
        expect(response).to have_http_status(302)
      end
    end
    context "ログインユーザーがいるとき" do
      it "works!" do
        get budget_groups_path
        expect(response).to have_http_status(302)
      end
    end
  end
end
