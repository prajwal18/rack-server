require_relative 'controller'

class UsersController < RackServer::Controller
  def index
    response = render 'user_index', { users: UserService.all_users }
    [200, { 'Content-Type' => 'text/html' }, [response]]
  end

  def show
    user_id = env['QUERY_STRING'].split('=')[1]
    user = UserService.find_user_by_id(user_id)
    raise RouteError if user.empty?

    response = render 'user_show', { user: user[0] }
    [200, { 'Content-Type' => 'text/html' }, [response]]
  end

  def create
    response = render 'create_user'
    [200, { 'Content-Type' => 'text/html' }, [response]]
  end

  def submit
    request = Rack::Request.new(env)
    body = request.params
    redirect_url = 'http://localhost:4000/users/create'
    unless body['name'].nil? || body['age'].nil?
      UserService.create_user(body['name'], body['age'])
      redirect_url = 'http://localhost:4000/users/'
    end
    [302, { 'Location': redirect_url, 'Content-Type' => 'text/html' }, []]
  end

  def delete
    user_id = env['QUERY_STRING'].split('=')[1]
    redirect_url = 'http://localhost:4000/users/'
    UserService.delete_user_by_id(user_id)
    [302, { 'Location': redirect_url, 'Content-Type' => 'text/html' }, []]
  end
end
