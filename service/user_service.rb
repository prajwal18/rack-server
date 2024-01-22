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
    ensure
      connection&.close
    end

    def all_users
      query = 'SELECT name,age,id,customer_id,customer_name,email FROM users LEFT JOIN customers ON users.id = customers.user_id'
      results = connection.exec(query)
      results.each do |row|
        puts row
      end
    end

    def find_user_by_id(id)
      query = 'SELECT * FROM users LEFT JOIN customers ON users.id = customers.user_id WHERE users.id = $1'
      result = connection.exec(query, [id])
      result.each do |row|
        puts row
      end
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    ensure
      connection&.close
    end

    def delete_user_by_id(id)
      query = 'DELETE FROM users WHERE id = $1'
      connection.exec(query, [id])
      puts 'User is deleted'
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    ensure
      connection&.close
    end

    def update_user_name_by_id(id, name)
      query = 'UPDATE users SET name = $2 WHERE id = $1'
      connection.exec(query, [id, name])
      puts 'User name is updated'
    rescue PG::Error => e
      puts "Error while executing the query: #{e.message}"
    ensure
      connection&.close
    end
  end
end
