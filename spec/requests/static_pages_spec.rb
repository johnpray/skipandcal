require 'spec_helper'

describe "StaticPages" do
  
  describe "About page" do

  	it "says 'About' in the title tag" do
  		visit '/about'
  		page.should have_selector('title', text: 'About')
  	end

  	it "says 'About' somewhere on the page" do
  		visit '/about'
  		page.should have_content('About')
  	end
  end
end
