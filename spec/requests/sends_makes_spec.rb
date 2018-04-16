require 'rails_helper'

describe "Makes API" do
  it "sends makes in json format" do
    get "/api/v1/makes?year=2000"

    results = JSON.parse(response.body)

    expect(response.body).to be_a String
    expect(results.count).to eq(43)
  end
end
