require 'rails_helper'

describe "User can add vehicle to profile" do

  before(:all) do
    Capybara.current_driver = :selenium
  end

  context "As a user" do

    let(:user) { create(:user) }

    it "I can add a vehicle to my profile page" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_search_path

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

      click_on "Save Vehicle"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Vehicle saved")
      expect(page).to have_content("Chevrolet")
      expect(page).to have_content("Bolt EV")
      expect(page).to have_content("2018")
      expect(user.vehicles.count).to eq(1)
    end
  end
end
