# frozen_string_literal: true

require_relative 'controller'
class CustomersController < RackServer::Controller
  def index
    render 'customer_index', { customers: CustomerService.all_customers }
  end

  def show
    customer_id = env['QUERY_STRING'].split('=')[1]
    customer = CustomerService.find_customer_by_id(customer_id)
    raise RouteError, "Customer with id #{id} doesnt exist" if customer.empty?

    render 'customer_show', { customer: customer[0] }
  end

  def create
    users_dd = UserService.users_drop_down_list
    render 'create_customer', { users_dd: }
  end

  def submit
    request = Rack::Request.new(env)
    body = request.params
    unless body['name'].nil? || body['email'].nil? || body['user_id'].nil?
      CustomerService.create_customer(body['name'], body['email'],
                                      body['user_id'])
    end
    '<a href="http://localhost:4000/customers">Go back to home</a>'
  end
end
