require "rails_helper"

RSpec.describe "Homes", type: :request do
  describe "GET /" do
    it "redirect to login path" do
      get root_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it "returns http success" do
      sign_in FactoryBot.build_stubbed(:user, :admin)
      get root_path
      expect(response).to be_successful
    end
  end
end
