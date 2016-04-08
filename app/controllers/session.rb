get '/session/new' do
  erb :'/users/login'
end

post '/session' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Invalid credentials!"]
    erb :'/users/login'
  end
end

get '/session/end' do
  session.clear

  redirect '/'
end
