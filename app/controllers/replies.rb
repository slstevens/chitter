get '/peeps/reply/:id' do 
    if !current_user
      redirect '/sessions/new'
    else
    @message = Message.first(:id => params[:id])
    erb :"peeps/new_reply"
    end
end

post '/peeps/reply/:id' do
    reply = Reply.create(:reply_content => params[:reply_content],
                         :user_id => current_user.id,
                         :message_id => params[:message_id])
    redirect to '/'
end