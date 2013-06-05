  require 'spec_helper'
  
  describe "Footer page" do
    it "About should have the content Footer" do
      visit '/about'
      #Footer checks
      page.should have_content('alfrednutile@gmail.com')
      page.should have_content('345-5103')
      page.should have_content('resume')
    end

    it "Home should have the content Footer" do
      visit '/about'
      #Footer checks
      page.should have_content('alfrednutile@gmail.com')
      page.should have_content('345-5103')
    end
  end

  describe "Menu Testing" do
    it "Should go to about page" do
      visit '/home'
      click_link "About"
      page.should have_content('About')
    end
  end