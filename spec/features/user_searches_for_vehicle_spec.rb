require 'rails_helper'

describe "User can add vehicle to profile" do

  before(:all) do
    Capybara.current_driver = :selenium
  end

  context "As a user" do

    let(:user) { User.new }

    it "I can search for a vehicle and see it's information and range on a map" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit dashboard_path
      click_on "Add First Vehicle"

      expect(current_path).to eq(new_search_path)
      expect(page).to have_content("Find Your Vehicle")

      fill_in "Enter Home Address", with: "1331 17th St, Denver, CO"

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
      click_on 'Find!'

      expect(current_path).to eq(new_search_path)
      expect(page).to have_content("Make: Chevrolet")
      expect(page).to have_content("Model: Bolt EV")
      expect(page).to have_content("Year: 2018")
      expect(page).to have_content("Fuel Type: Electricity")
      expect(page).to have_content("Range: 238 miles")
      expect(page).to have_content("MPGe: 0")
      expect(page).to have_content("Time to charge at 120V: n/a")
      expect(page).to have_content("Time to charge at 240V: 9 hours")
      expect(page).to have_css(".car-image")
    end
  end
end
