require './spec/spec_helper'
require './app/models/message'

feature "User browses the list of messages (peeps)" do

	before(:each) do
		user = User.create(:email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
		# Message.create(:content => "Hello, World #Greeting #Peace")
		# Message.create(:content => "This is my name #Greeting #Stevens")
		# Message.create(:content => "School again #Education #Makers")
		# Message.create(:content => "Times of the day #Evening #Makers")
		Message.create(:content => "Hello, World #Greeting #Peace", user_id: user.id, hashtags: [Hashtag.first_or_create(text: "#Greeting"), Hashtag.first_or_create(text: "#Peace")])
		Message.create(:content => "This is my name #Greeting #Stevens", user_id: user.id, hashtags: [Hashtag.first_or_create(text: "#Greeting"), Hashtag.first_or_create(text: "#Stevens")])
		Message.create(:content => "School again #Education #Makers", user_id: user.id, hashtags: [Hashtag.first_or_create(text: "#Education"), Hashtag.first_or_create(text: "#Makers")])
		Message.create(:content => "Times of the day #Evening #Makers", user_id: user.id, hashtags: [Hashtag.first_or_create(text: "#Evening"), Hashtag.first_or_create(text: "#Makers")])
	end

	scenario "when opening the home page" do
		visit '/'
    	expect(page).to have_content("Hello, World #Greeting #Peace")
    end


	scenario "filtered by a hashtag" do #I have no idea why this is failing
		visit '/hashtags/%23Greeting'
 		expect(page).not_to have_content("School again #Education #Makers")
  		expect(page).not_to have_content("Times of the day #Evening #Makers")
  		expect(page).to have_content("This is my name #Greeting #Stevens")
  		expect(page).to have_content("Hello, World #Greeting #Peace")
	end

	scenario "and to be able to click on a hashtag link" do
		visit '/' 
		expect(page).to have_link("#Greeting") #I could extend this test. But not whilst the above test is failing
		expect(page).to have_link("#Peace")
	end


	# scenario "and can see who posted the peep" do
	# 	visit '/'
	# 	expect(page).to have_content("Posted by seanstevens)")
	# end
end