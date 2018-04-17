require 'rails_helper'

describe "User can add vehicle to profile" do
  context "As a user" do

    let(:user) { User.new }

    it "I can add a vehicle to my profile page" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit dashboard_path
      click_on "Add First Vehicle"

      expect(current_path).to eq(new_search_path)
      expect(page).to have_content("Find Your Vehicle")

      fill_in "Enter Home Address", with: "1331 17th St, Denver, CO"

      within '.year-menu' do
        find("option[value='2018']").select_option
      end
      select "Chevrolet", from: "make-menu"
      select "Volt", from: "Select Model"
      click_on 'Find'

      expect(current_path).to eq(search_path)
      expect(page).to have_content("Make: Chevrolet")
      expect(page).to have_content("Model: Volt")
      expect(page).to have_content("Year: 2014")
      expect(page).to have_content("Fuel Type: Premium Gas or Electricity")
      expect(page).to have_content("Range: 38 miles")
      expect(page).to have_content("MPGe: 98")
      expect(page).to have_content("Time to charge at 120V: n/a")
      expect(page).to have_content("Time to charge at 240V: 4.0 hours")
    end
  end
end