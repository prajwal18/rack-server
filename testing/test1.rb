# frozen_string_literal: true

require './db/db'

require './service/user_service'

require './service/customer_service'

db = Db.new
service = CustomerService.new(db)

# service.create_user('unesh', 22)

# service.update_user_name_by_id(2, 'prajwal2')

# service.create_customer('kim', 'kimdasd@test.com', 2)

service.all_customers

# service.delete_user_by_id(1)
