# Homepage (Root path)
helpers do
	def current_user
		@current_user = User.find_by(id: session[:user_id]) if session[:user_id]
	end
end

get '/' do
	erb :index
end

get '/login' do
	erb :login
end

post '/login' do
	email = params[:email]
	password = params[:password]
	user = User.find_by(email: email)
	if user.password == password
		session[:user_id] = user.id
		redirect '/'
	else
		redirect '/login'
	end
end

get '/signup' do
	erb :signup
end

post '/signup' do
	email = params[:email]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
    if User.find_by(email: email)
		redirect '/login'
	else
		user = User.create(email: email, password: password, first_name: first_name, last_name: last_name)
		session[:user_id] = user.id
		redirect '/'
	end
end

get '/profile' do
	erb :profile
end

post '/profile' do
	redirect '/'
end