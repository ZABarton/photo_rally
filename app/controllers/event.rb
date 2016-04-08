get '/events/:id' do
  @event = Event.find(params[:id])
  erb :'/events/show_event'
end
