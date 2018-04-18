require 'rails_helper'

describe GeocodeService do
  context "Instance methods" do
    context "#get_linestring" do
      it "returns decoded WKB" do
        GeocodeService.new.get_linestring(1, 2)
    
      end
    end
  end
end
