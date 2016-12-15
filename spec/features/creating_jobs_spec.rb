require "rails_helper"

RSpec.feature "Anonymous users can create a job posting" do
    
    before do
        visit "/"
        
        click_link "Post A Job"
    end
  
    scenario "with valid attributes" do
        fill_in "Title", with: "Test Job"
        fill_in "Company", with: "Test Company"
        fill_in "Url", with: "www.google.com"
        fill_in "Location", with: "Seattle"
        choose("Job")
        fill_in "Description", with: "Description text"
        click_button "Submit Job"

        expect(page).to have_content "Creation Successful"
    end
    
    scenario "with no title" do
      
        fill_in "Company", with: "Test Company"
        fill_in "Url", with: "www.google.com"
        fill_in "Location", with: "Seattle"
        choose("Job")
        fill_in "Description", with: "Description text"
        click_button "Submit Job"

        expect(page).to have_content "prohibited this record from being saved"
    
    end
    
    scenario "with no company" do
      
        fill_in "Title", with: "Test Job"
        fill_in "Url", with: "www.google.com"
        fill_in "Location", with: "Seattle"
        choose("Job")
        fill_in "Description", with: "Description text"
        click_button "Submit Job"

        expect(page).to have_content "prohibited this record from being saved"
    
    end
        
    scenario "with no url" do
        fill_in "Title", with: "Test Job"
        fill_in "Company", with: "Test Company"
        fill_in "Location", with: "Seattle"
        choose("Job")
        fill_in "Description", with: "Description text"
        click_button "Submit Job"

        expect(page).to have_content "prohibited this record from being saved"
    end
    
    scenario "with no location" do
        fill_in "Title", with: "Test Job"
        fill_in "Company", with: "Test Company"
        fill_in "Url", with: "www.google.com"
        choose("Job")
        fill_in "Description", with: "Description text"
        click_button "Submit Job"

        expect(page).to have_content "prohibited this record from being saved"
    end
    
    scenario "with no description" do
        fill_in "Title", with: "Test Job"
        fill_in "Company", with: "Test Company"
        fill_in "Url", with: "www.google.com"
        fill_in "Location", with: "Seattle"
        choose("Job")
        click_button "Submit Job"

        expect(page).to have_content "prohibited this record from being saved"
    end
    
end