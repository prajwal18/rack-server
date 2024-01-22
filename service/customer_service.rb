# frozen_string_literal: true

require './db/db'

# Class for customer services for creating, updating and deleting data in database
class CustomerService
  class << self
    def connection
      @connection ||= Db.new.connection
    end

    def create_customer(name, email, user_id)
      query = 'INSERT INTO customers (customer_name, email, user_id) VALUES($1, $2, $3)'
      connection.exec(query, [name, email, user_id])

      puts 'Customer is created'
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    ensure
      connection&.close
    end

    def all_customers
      query = 'SELECT * FROM customers INNER JOIN users ON customers.user_id = users.id'
      results = connection.exec(query)
      results.each do |row|
        puts row
      end
    end

    def find_customer_by_id(id)
      query = 'SELECT * FROM customers INNER JOIN users ON customers.user_id = users.id WHERE customers.customer_id = $1'
      result = connection.exec(query, [id])
      result.each do |row|
        puts row
      end
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    ensure
      connection&.close
    end

    def delete_customer_by_id(id)
      query = 'DELETE FROM customers WHERE customer_id = $1'
      connection.exec(query, [id])
      puts 'Customer is deleted'
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    ensure
      connection&.close
    end

    def update_customer_email_by_id(id, email)
      query = 'UPDATE customers SET email = $2 WHERE id = $1'
      connection.exec(query, [id, email])
    end
  end
end
