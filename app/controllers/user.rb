
get '/users' do
  redirect '/' unless logged_in?
  redirect "/users/#{current_user.id}"
end

get '/users/new' do
  erb :'users/register'
end

post '/users' do
  @user = User.new(username: params[:username], email: params[:email])
  @user.password = params[:password]
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new_user'
  end
end

get '/users/:id' do
  redirect '/' unless logged_in?
  @user = User.find_by(id: params[:id])
  redirect "/users/#{current_user.id}" unless @user
  erb :'users/show_user'
end
