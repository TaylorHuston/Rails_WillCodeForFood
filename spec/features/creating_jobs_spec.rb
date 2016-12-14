require "rails_helper"

RSpec.feature "Anonymous users can create a job posting" do
  scenario "with valid attributes" do
    visit "/"
    
    click_link "Post A Job"
    fill_in "Title", with: "Test Job"
    fill_in "Company", with: "Test Company"
    fill_in "Url", with: "www.google.com"
    fill_in "Location", with: "Seattle"
    choose("Job")
    fill_in "Description", with: "Description text"
    click_button "Submit Job"
    
    expect(page).to have_content "Creation Successful"
    
  end
end