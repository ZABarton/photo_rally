require 'dotenv'
Dotenv.load
require "instagram"

CALLBACK_URL = "http://localhost:9393/oauth/callback"

Instagram.configure do |config|
  config.client_id = ENV["CLIENT_ID"]
  config.client_secret = ENV["CLIENT_SECRET_ID"]
end

get "/" do
  erb :index
end

get "/oauth/connect" do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/oauth/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token
  redirect "/nav"
end

get "/nav" do
  @html = ""
  erb :pictures_show
end

get "/photos" do
  client = Instagram.client(:access_token => session[:access_token])
  user = client.user
  @html = "<h1>#{user.username}'s recent media</h1>"
  for media_item in client.user_recent_media
    @html << "<div><img src='#{media_item.images.thumbnail.url}'><br/></div>"
  end
  @html << "<a href='/nav'>Go back</a>"
  erb :pictures_show
end

get "/logout" do
  session.clear

  redirect '/'
end
