post '/messages' do
	content = params["content"]
	hashtags = params["content"].scan(/#\w+/).flatten.map{|hashtag| Hashtag.first_or_create(:text => hashtag)}
	Message.create(:content => content, :hashtags => hashtags, :user_id => current_user.id)
	redirect to('/')

end

get '/hashtags/:text' do
	hashtag = Hashtag.first(:text => params[:text])
	@messages = hashtag ? hashtag.messages : []
	erb :index
end