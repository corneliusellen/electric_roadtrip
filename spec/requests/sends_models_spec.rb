require 'rails_helper'

describe "Models API" do
  it "sends models in json format" do
    VCR.use_cassette("Model Search") do
      get "/api/v1/models?make=chevrolet&year=2018"

      results = JSON.parse(response.body)

      expect(response.body).to be_a String
      expect(results.count).to eq(36)
    end 
  end
end
