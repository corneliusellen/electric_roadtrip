require 'rails_helper'

describe NrelService do
  it "does the thing" do
    linestring = GeocodeService.new.get_linestring(1, 2)
    stations = NrelService.new(linestring, 2).get_stations
    binding.pry
  end
end
