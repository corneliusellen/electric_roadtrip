require 'rails_helper'

describe "User can add vehicle to profile", js: true do
  before(:all) do
    Capybara.current_driver = :selenium
  end
  context "As a user" do

    let(:user) { User.new }

    it "I can add a vehicle to my profile page" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_search_path

      fill_in "Enter Home Address", with: "1331 17th St, Denver, CO"
      driver = page.driver.browser
      options = driver.find_element(:class, 'year-menu').find_elements(tag_name: 'option')
      options.each do |option|
        option.click if option.attribute('value') == "2018"
      end

      driver = page.driver.browser
      options = driver.find_element(:class, 'make-menu').find_elements(tag_name: 'option')
      options.each do |option|
        option.click if option.attribute('value') == "Chevrolet"
      end

      driver = page.driver.browser
      dropdown = driver.find_element(:class, 'option-menu')
      options = dropdown.find_elements(tag_name: 'option')
      options.each { |option| option.click if option.text == "Auto (variable gear ratios), 4 cyl, 1.5 L"}

      click_on 'Find'

      expect(current_path).to eq(new_search_path)

      click_on "Save Vehicle"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Make: Chevrolet")
      expect(page).to have_content("Model: Volt")
      expect(page).to have_content("Year: 2014")
    end
  end
end
