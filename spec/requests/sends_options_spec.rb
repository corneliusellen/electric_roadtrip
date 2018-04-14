require 'rails_helper'

describe "Options API" do
  it "sends options in json format" do
    get "/api/v1/options?model=bolt ev&make=chevrolet&year=2018"

    results = JSON.parse(response.body)

    expect(response.body).to be_a String
    expect(results.count).to eq(2)
    expect(results["value"]).to eq("39786")
  end
end
