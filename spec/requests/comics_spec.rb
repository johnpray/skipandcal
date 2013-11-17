require 'spec_helper'

describe "Comics" do

  describe "Home page" do

  	before :each do
  		FactoryGirl.create(:comic)
  		FactoryGirl.create(:comic)
  		FactoryGirl.create(:comic, title: "Most Recent Published Comic")
  		FactoryGirl.create(:unpublished, title: "Most Recent Unpublished Comic")
  	end

  	it "shows the most recent published comic" do
  		visit '/'
  		page.should have_selector('#content .comic .title', text: "Most Recent Published Comic")
  	end

  	it "doesn't redirect away from the root URL" do
  		visit '/'
  		current_path.should eq root_path
  	end

  	it "loads Google Analytics when not logged in on production"

  	it "doesn't load Google Analytics when logged in on production"

  end

  describe "Individual comic" do

  	it "displays the correct comic and its attributes"

  	it "maintains the category passed in by URL"

  	it "contains the correct Open Graph tags"

  	it "contains the correct Twitter Card tags"

  	it "shows the Cardinal Courier note when it has the Cardinal Courier category"
  end

  describe "Comic archives" do

  	it "contains the titles of all published comics when no category is specified" do
      cookies[:remember_token] = ''
      visit '/comics'
      Comic.where(published: true).each do |comic|
        page.should have_selector('#content .comic .title', text: comic.title)
      end
    end

    it "doesn't contain the titles of any unpublished comics when no category is specified" do
      cookies[:remember_token] = ''
      visit '/comics'
      Comic.where(published: false).each do |comic|
        page.should_not have_selector('#content .comic .title', text: comic.title)
      end
    end

  	it "shows all comics, including unpublished ones, when logged in" #cookies[:remember_token] = ADMIN_REMEMBER_TOKEN

  	it "shows only comics with the category specified"

	end

	describe "Atom/RSS feed" do

		it "generates valid XML"

		it "includes all published comics"

		it "doesn't include unpublished comics"
	end
end
