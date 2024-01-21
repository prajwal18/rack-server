# frozen_string_literal: true

require './db/db'

require './service/user_service'

require './service/customer_service'

db = Db.new
service = UserService.new(db)

service.all_users
# service2 = CustomerService.new(db)

# service2.create_customer('noone', 'noone@email.com', 2)

# service.create_user('prajwal', 22)

# service.find_user_by_id(2)

# service2.find_customer_by_id(2)
# service.update_user_name_by_id(2, 'prajwal2')

# service2.create_customer('joke', 'joke@test.com', 1)

# service.all_users_with_customers

# service2.all_customers

# service.delete_user_by_id(1)
