get '/session/new' do
  redirect "https://api.instagram.com/oauth/authorize/?client_id=ff007afc46a04acf8e366890633afb73&redirect_uri=http://www.zachbarton.com&response_type=code"
end

get '/users/show' do
  erb :pictures_show
end
