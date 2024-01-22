require_relative 'controller'
class CustomersController < RackServer::Controller
  def index
    render 'customer_index', {}
  end

  def show
    render 'customer_show', {}
  end
end
