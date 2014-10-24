module SessionHelpers
	
	def sign_in(email = "alice@example.com",
              username = "alice",
              password = "oranges!")
    	visit '/sessions/new'
    	fill_in 'email', :with => email
      fill_in 'username', :with => username
    	fill_in 'password', :with => password
    	click_button 'Sign in'
    end

    def sign_up(email = "alice@example.com",
              username = "alice",
              password = "oranges!",
              password_confirmation = "oranges!")
	    visit '/users/new'
	    fill_in :email, :with => email
      fill_in :username, :with => username
	    fill_in :password, :with => password
	    fill_in :password_confirmation, :with => password_confirmation
	    click_button "Sign up"
  	end

    def add_message(content)
      sign_in('test@test.com', "alice", 'test')
      within('#new-message') do
        fill_in 'content', :with => content
        click_button 'Peep!'
      end
    end
end