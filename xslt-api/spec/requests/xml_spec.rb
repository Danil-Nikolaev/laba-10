require 'rails_helper'

RSpec.describe "Xmls", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/xml/index"
      expect(response).to have_http_status(:success)
    end
  end

end
