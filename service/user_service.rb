# frozen_string_literal: true

require './db/db'
# Class for user services for creating, updating and deleting data in database
class UserService
  class << self
    def connection
      @connection ||= Db.new.connection
    end

    def create_user(name, age)
      query = 'INSERT INTO users (name, age) VALUES($1,$2)'
      connection.exec(query, [name, age])
      puts 'User is created'
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    end

    def all_users
      query = 'SELECT * FROM users LEFT JOIN customers ON users.id = customers.user_id'
      results = connection.exec(query)
      hash_converter(results)
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    end

    def find_user_by_id(id)
      query = 'SELECT * FROM users LEFT JOIN customers ON users.id = customers.user_id WHERE users.id = $1'
      result = connection.exec(query, [id])
      hash_converter(result)
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    end

    def delete_user_by_id(id)
      query = 'DELETE FROM users WHERE id = $1'
      connection.exec(query, [id])
      puts 'User is deleted'
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    end

    def update_user_name_by_id(id, name)
      query = 'UPDATE users SET name = $2 WHERE id = $1'
      connection.exec(query, [id, name])
      puts 'User name is updated'
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    end

    def users_drop_down_list
      query = 'SELECT * FROM users'
      results = connection.exec(query)
      results.to_a
      # hash_converter(results)
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    end

    private

    def hash_converter(results)
      users_with_customers = {}
      results.map do |row|
        unless users_with_customers.key?(row['id']) # Checking if the user_id key exists in hash or not
          users_with_customers[row['id']] = {
            id: row['id'],
            name: row['name'],
            age: row['age'],
            customers: []
          }
        end

        # skipping iteration if customer_id is nil
        next if row['customer_id'].nil?

        # For adding customers data to user
        users_with_customers[row['id']][:customers] << {
          customer_id: row['customer_id'],
          customer_name: row['customer_name'],
          customer_email: row['email']
        }
      end
      users_with_customers.values
    end
  end
end
