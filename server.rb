require 'data_mapper'
require 'sinatra'
require 'sinatra/assetpack'
require './lib/message'
require './lib/hashtag'
require './lib/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'super secret'
# use Rack::Flash, :sweep => true


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

get '/hashtags/:text' do
	hashtag = Hashtag.first(:text => params[:text])
	@messages = hashtag ? hashtag.messages : []
	erb :index
end

get '/users/new' do
  # note the view is in views/users/new.erb
  # we need the quotes because otherwise
  # ruby would divide the symbol :users by the
  # variable new (which makes no sense)
  erb :"users/new"
end

post '/users' do
  	user = User.create(:email => params[:email],
                       :password => params[:password],
                       :password_confirmation => params[:password_confirmation])
 	session[:user_id] = user.id
    redirect to('/')
end

# ------------------------------
# ------------------------------
# ------------------------------

helpers do

def link_to(url,text=url,opts={})
  attributes = ""
  opts.each { |key,value| attributes << key.to_s << "=\"" << value << "\" "}
  "<a href=\"#{url}\" #{attributes}>#{text}</a>"
end

def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
end

end

# .to_s.gsub(/^./, "").downcase.to_sym