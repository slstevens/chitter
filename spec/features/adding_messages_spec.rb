require 'spec_helper'

feature "User adds a new message(peep)" do
  scenario "when browsing the homepage" do
    expect(Message.count).to eq(0)
    visit '/'
    add_message("Hello, World")
    expect(Message.count).to eq(1)
    message = Message.first
    expect(message.content).to eq("Hello, World")
  end

  def add_message(content)
    within('#new-message') do
      fill_in 'content', :with => content
      click_button 'Peep!'
    end
  end
end