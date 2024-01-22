# frozen_string_literal: true

# require './db/db'

require './service/user_service'

require './service/customer_service'


# CustomerService.create_customer('Cmn', 'Cmn@test.com', 4)
puts UserService.all_users
# puts UserService.find_user_by_id(2)
# UserService.delete_user_by_id(2)
# puts UserService.update_user_name_by_id(2, 'Eunesh')
# all_user.each do |data|
#   puts data
# end
# CustomerService.delete_customer_by_id(1)
# db = Db.new
# service = UserService.new(db)

# service.all_users
# service2 = CustomerService.new(db)

# service2.create_customer('noone', 'noone@email.com', 2)

# service.create_user('dipesh', 25)

# service.find_user_by_id(2)

# service2.find_customer_by_id(2)
# service.update_user_name_by_id(4, 'Dibesh')

# service2.create_customer('nomo', 'nomo@test.com', 2)

# service.all_users_with_customers

# service2.all_customers

# service.delete_user_by_id(1)
