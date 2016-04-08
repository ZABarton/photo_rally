helpers do
  def logged_in?
    session[:user_id]
  end

  def current_user
    @current_user = User.find(session[:user_id])
  end

  def is_this_you?(user)
    current_user.id == user.id
  end
end
