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

get '/projects/new' do
	erb :new_project
end

post '/projects/create' do
	name = params[:name]
	category = params[:category]
	creator = params[:creator]
	funding_goal = params[:funding_goal].to_i
	funding_pledged = params[:funding_pledged].to_i
	new_project = current_user.projects.create(name: name, category: category, funding_goal: funding_goal, funding_pledged: funding_pledged)
	some_creator = Creator.find_by(name: creator)
	new_project.creator = some_creator
	new_project.save
	redirect "/projects/#{new_project.id}"
end

get '/projects/:id' do
	@project = Project.find(params[:id])
	erb :project
end