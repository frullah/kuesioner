require 'rails_helper'

RSpec.describe "Kuesioners", type: :request do

  describe "GET /isi" do
    it "returns http success" do
      get "/kuesioner/isi"
      expect(response).to have_http_status(:success)
    end
  end

end
