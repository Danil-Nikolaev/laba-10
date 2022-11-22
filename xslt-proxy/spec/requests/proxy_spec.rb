require 'rails_helper'

RSpec.describe "Proxies", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/proxy/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /output" do
    it "returns http success" do
      get "/proxy/output"
      expect(response).to have_http_status(:success)
    end
  end

end
