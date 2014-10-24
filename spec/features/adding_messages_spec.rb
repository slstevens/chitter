require 'spec_helper'
require_relative 'helpers/session'

feature "User adds a new message(peep)" do
  
  before(:each) do
    User.create(:email => "test@test.com",
                :username => 'alice',
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario "when browsing the homepage" do
    expect(Message.count).to eq(0)
    visit '/header'
    add_message("Hello, World")
    expect(Message.count).to eq(1)
    message = Message.first
    expect(message.content).to eq("Hello, World")
  end

  scenario "with a few tags" do
    visit "/"
    add_message("Hello, World #Greeting #Peace")
    message = Message.first
    expect(message.hashtags.map(&:text)).to include("#Greeting")
    expect(message.hashtags.map(&:text)).to include("#Peace")
  end

  scenario "can reply to other posts" do
    sign_in
    add_message("Test peep")
    expect(page).to have_content "Test peep"
    click_link 'Reply'
    fill_in 'reply_content', :with => "I agree"
    click_button "Reply!"
    expect(page).to have_content "I agree"
  end


end 
