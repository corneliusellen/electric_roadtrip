require 'rails_helper'

describe "User can add vehicle to profile" do
  context "As a user" do

    let(:user) { User.new }

    it "I can add a vehicle to my profile page" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit dashboard_path
      click_on "Add First Vehicle"

      expect(current_path).to eq(new_search_path)
      expect(page).to have_content("Find your vehicle")

      fill_in('Vehicle ID', with: 123)
      click_on 'Submit'

      expect(current_path).to eq(search_path)
      expect(page).to have_content("Some vehicle information: make, model, year, fuel type, mpg, emissions, picture w color IF ev: range, time to charge")
    end
  end
end
