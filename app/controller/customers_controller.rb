require_relative 'controller'

class CustomersController < RackServer::Controller
  def index
    response = render 'customer_index', { customers: CustomerService.all_customers }
    [200, { 'Content-Type' => 'text/html' }, [response]]
  end

  def show
    customer_id = env['QUERY_STRING'].split('=')[1]
    customer = CustomerService.find_customer_by_id(customer_id)

    raise RouteError if customer.empty?

    response = render 'customer_show', { customer: customer[0] }
    [200, { 'Content-Type' => 'text/html' }, [response]]
  end

  def create
    users_dd = UserService.users_drop_down_list
    response = render 'create_customer', { users_dd: users_dd }
    [200, { 'Content-Type' => 'text/html' }, [response]]
  end

  def submit
    request = Rack::Request.new(env)
    body = request.params
    redirect_url = 'http://localhost:4000/customers/create'
    unless body['name'].nil? || body['email'].nil? || body['user_id'].nil?
      CustomerService.create_customer(body['name'], body['email'],
                                      body['user_id'])
      redirect_url = 'http://localhost:4000/customers/'
    end
    [302, { 'Location': redirect_url, 'Content-Type' => 'text/html' }, []]
  end
end
