require 'rails_helper'

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    provider: "google",
      uid: "123456789",
      info: {
        email: "gellinellen@gmai.com",
        first_name: "Ellen",
        last_name: "Cornelius"
      },
      credentials: {
        token: "abc123",
        refresh_token: "123ab",
        expires_at: DateTime.now,
      }
    })
end

describe "User logs in" do
  scenario "Using google oauth2" do
    stub_omniauth
    visit root_path
    click_link("Sign in with Google")

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Hello, Ellen Cornelius")
    expect(page).to have_link("Logout")
  end
end
