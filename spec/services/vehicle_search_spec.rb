require 'rails_helper'

describe VehicleSearch do
  context "Instance methods" do
    context "#get_years" do
      it "returns json list of years" do
        VCR.use_cassette("Year Search") do
          results = VehicleSearch.new.get_years

          expect(results).to be_an Array
          expect(results.last["value"]).to eq("1984")
          results.each do |result|
            expect(result).to have_key "text"
            expect(result).to have_key "value"
            expect(result["text"]).to be_a String
            expect(result["value"]).to be_a String
          end
        end
      end
    end

    context "#get_makes" do
      it "returns json list of makes" do
        VCR.use_cassette("Make Search") do
          results = VehicleSearch.new.get_makes("2018")

          expect(results).to be_an Array
          results.each do |result|
            expect(result).to have_key "text"
            expect(result).to have_key "value"
            expect(result["text"]).to be_a String
            expect(result["value"]).to be_a String
          end
        end
      end
    end

    context "#get_models" do
      it "returns json list of models" do
        VCR.use_cassette("Model Search") do
          results = VehicleSearch.new.get_models("2018", "chevrolet")

          expect(results).to be_an Array
          results.each do |result|
            expect(result).to have_key "text"
            expect(result).to have_key "value"
            expect(result["text"]).to be_a String
            expect(result["value"]).to be_a String
          end
        end
      end
    end

    context "#get_options" do
      it "returns json list of options" do
        VCR.use_cassette("Option Search") do
          result = VehicleSearch.new.get_options("2018", "chevrolet", "bolt ev")

          expect(result).to be_a Hash
          expect(result).to have_key "text"
          expect(result).to have_key "value"
          expect(result["text"]).to be_a String
          expect(result["value"]).to be_a String
          expect(result["text"]).to eq("Auto (A1)")
          expect(result["value"]).to eq("39786")
        end
      end
    end

    context "#find_vehicle" do
      it "returns json vehicle information" do
        VCR.use_cassette("Vehicle Search") do
          result = VehicleSearch.new("39786").find_vehicle

          expect(result).to be_a Hash
          expect(result).to have_key "year"
          expect(result).to have_key "make"
          expect(result).to have_key "model"
          expect(result).to have_key "fuelType"
          expect(result).to have_key "range"
          expect(result).to have_key "charge120"
          expect(result).to have_key "charge240"
        end
      end
    end
  end
end
