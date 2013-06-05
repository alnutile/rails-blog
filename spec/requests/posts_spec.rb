require 'spec_helper'

describe "posts Page" do
  subject {page}
  describe "Full Page" do
    before { visit '/posts' }
    it "Should have title Blog" do
      #Think I need angular tests
      #to do the js part of this
      should have_content('Blog & Stuff')
    end
    it "Should have some content" do
      #Think I need angular tests
      #to do the js part of this
      should have_content('Tags')
      should have_selector('div.blog-full h2 a', text: "Test Blog 4")
    end
	#it { should have_selector('li.blog-link span', text: 'Test Blog 1') }
  end

  describe "Edit Post" do
    let(:user) { FactoryGirl.create(:user) }

    before { sign_in user }

    it "Should let you edit content" do
      visit '/posts/1/edit'
      fill_in "Title", with: 'Testing Edit'
      fill_in "Tags (separated by commas)", with: 'Testing Tags'
      click_button "Update Post"
      page.should have_selector('p', text: "Testing Tags") 
      page.should have_selector('h2', text: "Testing Edit") 
    end
  end

  describe "Visit Posts" do
    before { visit '/posts'}
    it "Should numerous items in the list" do
      page.should have_selector('a.blog-link', text: 'Test Blog 4')
    end
  end

end