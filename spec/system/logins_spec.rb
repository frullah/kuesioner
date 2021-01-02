require "rails_helper"

RSpec.describe "Logins", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "should redirect to / when login success" do
    user = FactoryBot.create(:user, :admin)
    visit new_user_session_path
    fill_in "Username", with: user.username
    fill_in "Kata sandi", with: user.password
    click_button "Log in"
    expect(page).to have_current_path(root_path)
  end

  it "should show alert" do
    user = FactoryBot.build_stubbed(:user)
    visit new_user_session_path
    fill_in "Username", with: user.username
    fill_in "Kata sandi", with: user.password
    expect { click_button "Log in" }.not_to change(page, :current_path)
    expect(page).to have_content("Ketidaksesuaian Username atau kata sandi")
  end
end
