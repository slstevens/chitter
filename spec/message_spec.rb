require 'spec_helper'
require 'data_mapper'

describe Message do

  context "Demonstration of how datamapper works" do

    # This is not a real test, it's simply a demo of how it works
    it 'should be created and then retrieved from the db' do
      # In the beginning our database is empty, so there are no links
      expect(Message.count).to eq(0)
      # this creates it in the database, so it's stored on the disk
      Message.create(:content => "Hello, this is the first message", :user_id => 1)
      # We ask the database how many links we have, it should be 1
      expect(Message.count).to eq(1)
      # Let's get the first (and only) link from the database
      message = Message.first
      # Now it has all properties that it was saved with.
      expect(message.content).to eq("Hello, this is the first message")
      # If we want to, we can destroy it
      message.destroy
      # so now we have no links in the database
      expect(Message.count).to eq(0)
    end

  end

end
