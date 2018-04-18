require 'rails_helper'

describe "Makes API" do
  it "sends makes in json format" do
    VCR.use_cassette("Make Search") do
      get "/api/v1/makes?year=2018"

      results = JSON.parse(response.body)

      expect(response.body).to be_a String
      expect(results.count).to eq(46)
    end
  end
end
