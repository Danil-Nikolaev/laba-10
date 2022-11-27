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
    it "method should return xml" do
      get '/proxy/output', params: {:v1=>"2", :v2=>"3", :side=>"client", :commit=>"Calc result"}
      str = response.body[1..20]
      expect(str.include? '?xml').to eq(true)
    end
    it 'method client-with-xslt return xml' do
      get '/proxy/output', params: {:v1=>"2", :v2=>"3", :side=>"client-with-xslt", :commit=>"Calc result"}
      str = response.body[1..20]
      expect(str.include? '?xml').to eq(true)
    end
  end

end
