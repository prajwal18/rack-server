# frozen_string_literal: true

require_relative 'controller'
class UsersController < RackServer::Controller
  def index
    render 'user_index', { users: UserService.all_users }
  end

  def show
    user_id = env['QUERY_STRING'].split('=')[1]
    user = UserService.find_user_by_id(user_id)
    raise RouteError if user.empty?

    render 'user_show', { user: user[0] }
  end

  def create
    render 'create_user'
  end

  def submit
    request = Rack::Request.new(env)
    body = request.params
    UserService.create_user(body['name'], body['age']) unless body['name'].nil? || body['age'].nil?
    '<a href="http://localhost:4000/users">Go back to home</a>'
  end
end
