class SearchController < ApplicationController

  def new
  end

  def index
    vehicle_info = VehicleSearch.new(params["Vehicle ID"]).find_vehicle
    @vehicle = Vehicle.new(vehicle_info)
  end
end

class VehicleSearch
  def initialize(id)
    @id = id.to_i
  end

  def find_vehicle
      response = Faraday.get("https://www.fueleconomy.gov/ws/rest/vehicle/#{id}")
      json = Hash.from_xml(response.body).to_json
      JSON.parse(json)["vehicle"]
  end

  private

  attr_reader :id
end
