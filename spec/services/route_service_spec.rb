require 'rails_helper'

describe RouteService do
  context "Instance methods" do
    context "#get_linestring" do
      it "returns decoded WKB" do
        linestring = RouteService.new("1331 17th St, Denver, CO", "13th St & Ford Street, Golden, CO").get_linestring

        expect(linestring).to be_a String
      end
    end

    context "#get_route" do
      it "returns route in nested array format" do
        service = RouteService.new("1331 17th St, Denver, CO", "13th St & Ford Street, Golden, CO")
        service.get_linestring
        route = service.get_route

        expect(route).to be_an Array
      end
    end
  end
end
