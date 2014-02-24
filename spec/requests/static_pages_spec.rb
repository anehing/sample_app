require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do
    it "should have the content 'Home page'" do
      visit root_path
      click_link "Home"
      expect(page).to have_content('Home page')
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
    end
  end
  
  describe "Help page" do
    it "should have the content 'Help page'" do 
      visit help_path
      click_link "Help"
      expect(page).to have_content('Help page')
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    end
  end
  describe "about page" do
    it "should have the content 'About Us'" do 
      visit about_path
      click_link "About"
      expect(page).to have_content('About Us')
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
    end
  end
  describe "contact page" do
    it "should have the content 'Sample App'" do 
      visit contact_path
      click_link "Contact"
      expect(page).to have_content('Contact page')
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
    end
  end
end

