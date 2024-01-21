# frozen_string_literal: true

# Class for customer services for creating, updating and deleting data in database
class CustomerService
  def initialize(db)
    @connection = db.connection
  end

  def create_customer(name, email, user_id)
    query = "INSERT INTO customers (customer_name, email, user_id) VALUES('#{name}', '#{email}', '#{user_id}')"
    @connection.exec(query)
    puts 'Customer is created'
  rescue PG::Error => e
    puts "Error while executing the query: #{e.message}"
  ensure
    @connection&.close
  end

  def all_customers
    query = 'SELECT * FROM customers INNER JOIN users ON customers.user_id = users.id'
    results = @connection.exec(query)
    results.each do |row|
      puts row
    end
  end

  def find_customer_by_id(id)
    query = "SELECT * FROM customers INNER JOIN users ON customers.user_id = users.id WHERE customers.id = '#{id}'"
    result = @connection.exec(query)
    result.each do |row|
      puts row
    end
  rescue PG::Error => e
    puts "Error while executing the query: #{e.message}"
  ensure
    @connection&.close
  end
end
