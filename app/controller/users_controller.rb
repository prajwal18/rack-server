require_relative 'controller'
class UsersController < RackServer::Controller
  
  def index
    render 'user_index', {}
  end

  def show
    render 'user_show', {}
  end
end
