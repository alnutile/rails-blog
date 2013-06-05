require 'spec_helper'

describe "Static Content pages" do

  describe "Home page" do
    before { visit '/home' }
    it "should have the content 'Home and circles'" do
      page.should have_content('Alfred Nutile')

    end
  end

  describe "About page" do
  	before { visit '/about' }
    it "should have the content About" do
      page.should have_content('About')
      #click_on "here"
      #page.response_headers['Content-Type'].should eq "application/pdf"
    end
  end

end