require_relative 'controller'
class UsersController < RackServer::Controller
  def index
    render 'user_index', { users: UserService.all_users }
  end

  def show
    render 'user_show', {}
  end
end
