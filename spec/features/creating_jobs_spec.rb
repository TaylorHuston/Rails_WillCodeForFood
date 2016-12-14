require "rails_helper"

RSpec.feature "Anonymous users can create a job posting" do
  scenario "with valid attributes" do
    visit "/"
    
    click_link "Post A Job"
    
  end
end