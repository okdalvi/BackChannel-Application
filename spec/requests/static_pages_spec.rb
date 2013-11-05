require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'Welcome to the Wolfpack Live Forum'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Welcome to the Wolfpack Live Forum')
    end


     it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end
  end



  end