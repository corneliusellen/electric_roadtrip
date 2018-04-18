require 'rails_helper'

describe "User can find stations along route" do

  before(:all) do
    Capybara.current_driver = :selenium
  end

  context "As a User" do

    let(:user) { User.new }

     context "I can visit the Find Routes page" do
      context "I can enter a vehicle type, radius, and starting and ending points" do
        it "I see a map showing stations within provided raidus along route" do
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          visit new_route_path

          fill_in "Enter Starting Address", with: "1331 17th St, Denver, CO"
          fill_in "Enter Destination Address", with: "Keystone ski resort, Denver, CO"
          fill_in "Enter Radius", with: "1"
          within '.year-menu' do
            find("option[value='2018']").select_option
          end
          within '.make-menu' do
            find("option[value='Chevrolet']").select_option
          end
          within '.model-menu' do
            find("option[value='Bolt EV']").select_option
          end
          within '.option-menu' do
            find("option[value='39786'").select_option
          end
          click_on "Route!"

          expect(current_path).to eq(new_route_path)
          expect(page).to have_css("#station-map")
        end
      end
    end
  end
end
