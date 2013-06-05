require 'spec_helper'

describe "Projects Viewing" do
  subject {page}
  before { visit '/portfolio'}

  it "Should have a Full project" do
      should have_selector('h1', text: "Portfolio")
      should have_selector('h4.media-heading', text: "Test Project 4")
      should have_selector('div.span5.media-body p', text: "translation")

  end

  it "Should have a number of teaser projects" do
    should have_selector('div.port-4', text: "translation")
  end

end

describe "Projects Edit mode" do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  it "Should let you edit content" do

    visit '/projects/1/edit'
    fill_in "Title", with: 'Testing Edit'
    fill_in "Tags (separated by commas)", with: 'Testing Tags'
    click_button "Update Project"
    #page.should have_selector('p', text: "Testing Tags") 
    page.should have_selector('h4', text: "Testing Edit") 
  end

  it "Should let you create content" do


    visit '/projects/new'
    fill_in "Title", with: 'Testing New'
    fill_in "Tags (separated by commas)", with: 'Testing Tags'
    click_button "Create Project"
    #page.should have_selector('p', text: "Testing Tags") 
    page.should have_selector('h4', text: "Testing New") 
  end

end
