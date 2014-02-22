require 'spec_helper'

feature "static page" do
  scenario "test the static route function" do
    visit "/static_pages/home"
    expect(page).to have_text("Home page")
    visit "/static_pages/contact"
    expect(page).to have_text("Contact page")
    visit "/static_pages/help"
    expect(page).to have_text("Help page")
    visit "/static_pages/about"
    expect(page).to have_text("About Us")
    
  end
end

