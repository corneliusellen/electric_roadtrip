require 'rails_helper'

describe "Years API" do
  it "sends years in json format" do
    VCR.use_cassette("Year Search") do
      get "/api/v1/years"

      results = JSON.parse(response.body)

      expect(response.body).to be_a String
      expect(results.count).to eq(36)
    end
  end
end
