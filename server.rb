require 'data_mapper'
require 'sinatra'
require './lib/message'
require './lib/hashtag'


env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!


get '/' do
	@messages = Message.all
	erb :index
end

post '/messages' do
	content = params["content"]
	hashtags = params["content"].scan(/#\w+/).flatten.map{|hashtag| Hashtag.first_or_create(:text => hashtag)}
	Message.create(:content => content, :hashtags => hashtags)
	redirect to('/')
end