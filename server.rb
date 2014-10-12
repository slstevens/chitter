require 'data_mapper'
require 'sinatra'
require './lib/message'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/message'

DataMapper.finalize
DataMapper.auto_upgrade!


get '/' do
	@messages = Message.all
	erb :index
end

post '/messages' do
	content = params["content"]
	Message.create(:content => content)
	redirect to('/')
end