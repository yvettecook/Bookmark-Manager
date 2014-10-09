get '/forgot_password' do
	erb :forgot_password
end

post '/users/forgot_password' do
	email = params[:email]
	user = User.first(:email => email)
	if user
		token = Mailer.create_token
		user.password_token = token
		user.token_time_stamp = Mailer.create_time_stamp
		user.save
		Mailer.send_reset_email(user)
		flash[:notice] = "Link has been sent to your email"
	else
		flash[:notice] = "Sorry, email address not registered"
	end
	redirect to('/')
end

get '/user/reset_password/:token' do
	user = User.first(:password_token => :password_token)
	erb :"user/new_password"
end

post '/user/new_password' do
	user = User.first(:password_token => :password_token)
	p params[:new_password]
	p params[:new_password_confirmation]
end
