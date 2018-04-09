require 'rails_helper'

describe "User visits dashboard" do
  context "As a user" do

    let(:user) { User.new }

    it "I see name and button to add new vehicles" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      expect(user).to receive(:first_name).and_return("Ellen")
      expect(user).to receive(:last_name).and_return("Corn")
      visit dashboard_path

      expect(page).to have_content("Hello, Ellen Corn")
      expect(page).to have_link("Add First Vehicle")
      expect(page).to have_link("Logout")
    end
  end
end
