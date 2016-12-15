require "rails_helper"

RSpec.feature "New users can register" do
  scenario "with valid credentials" do
    visit "/"
    
    click_link "Login"
    
    click_link "Sign Up Here"
    
    fill_in "Name", with: "Test Name"
    fill_in "Email", with: "test2@gmail.com"
    fill_in "Password", with: "!234AbCd"
    fill_in "Password confirmation", with: "!234AbCd"
    
    click_button "Register"
    
    expect(page).to have_content "Registration Successful"

  end
end

    