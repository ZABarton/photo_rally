get '/categories/:category_id/articles' do
  @category = Category.find(params[:category_id])
  erb :'articles/index'
end

get '/categories/:category_id/articles/new' do
  @article = Article.new
  @category = Category.find(params[:category_id])
  erb :'articles/new'
end

post '/categories/:category_id/articles' do
  @category = Category.find(params[:category_id])
  @article = @category.articles.build(params[:article])
  if @article.save
    redirect "/categories/#{@category.id}/articles"
  else
    p @article.errors
    @errors = @article.errors.full_messages
    erb :'articles/new'
  end
end