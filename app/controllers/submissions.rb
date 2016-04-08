get '/submissions/:id/new' do
  @objective = Objective.find(params[:id])
  erb :'/events/submission'
end
