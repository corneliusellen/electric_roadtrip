require 'rails_helper'

describe "User can compare vehicles" do

  before(:all) do
    Capybara.current_driver = :selenium
  end

  context "As a user" do

    let(:user) { create(:user) }

    it "I can compare 2 vehicles and see the information and ranges on a map" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_comparision_path

      fill_in "Enter Home Address", with: "1331 17th St, Denver, CO"

      within '.year-menu-1' do
        find("option[value='2018']").select_option
      end
      within '.make-menu-1' do
        find("option[value='Chevrolet']").select_option
      end
      within '.model-menu-1' do
        find("option[value='Bolt EV']").select_option
      end
      within '.option-menu-1' do
        find("option[value='39786'").select_option
      end
      within '.year-menu-2' do
        find("option[value='2017']").select_option
      end
      within '.make-menu-2' do
        find("option[value='Nissan']").select_option
      end
      within '.model-menu-2' do
        find("option[value='Leaf']").select_option
      end
      within '.option-menu-2' do
        find("option[value='38428'").select_option
      end
      click_on 'Compare!'

      expect(current_path).to eq(new_comparision_path)
      expect(page).to have_content("2018")
      expect(page).to have_content("Chevrolet")
      expect(page).to have_content("Bolt EV")
      expect(page).to have_content("Range: 238 miles")
      expect(page).to have_content("2017")
      expect(page).to have_content("Nissan")
      expect(page).to have_content("Leaf")
      expect(page).to have_content("Range: 107 miles")
    end
  end
end
