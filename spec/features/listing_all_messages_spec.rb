require './spec/spec_helper'
require './lib/message'

feature "User browses the list of messages (peeps)" do

  before(:each) {
    Message.create(:content => "Hello, World.")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Hello, World.")
  end
end