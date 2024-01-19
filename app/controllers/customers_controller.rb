require_relative 'controller'
class CustomersController < RackServer::Controller
  def index
    'Get a list of all the users'
  end

  def show
    'There is nothing either good or bad ' +
      'but thinking makes it so.'
  end
end
