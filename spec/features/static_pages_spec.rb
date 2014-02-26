require 'spec_helper'

feature "static page" do
  scenario "test the static route function" do
    visit root_path
    expect(page).to have_text("Home page")
    visit contact_path
    expect(page).to have_text("Contact page")
    visit help_path
    expect(page).to have_text("Help page")
    visit about_path
    expect(page).to have_text("About Us")
    
  end
end


