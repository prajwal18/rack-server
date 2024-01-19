# frozen_string_literal: true

# Class for user services for creating, updating and deleting data in database
class UserService
  def initialize(db)
    @connection = db.connection
  end

  def create_user(name, age)
    query = "INSERT INTO users (name, age) VALUES('#{name}', '#{age}')"
    @connection.exec(query)
    puts 'User is created'
  rescue PG::Error => e
    puts "Error while executing the query: #{e.message}"
  ensure
    @connection&.close
  end

  def all_users
    query = 'SELECT * FROM users'
    results = @connection.exec(query)
    results.each do |row|
      puts row
    end
  end

  def find_user_by_id(id)
    query = "SELECT * FROM users WHERE id = '#{id}'"
    result = @connection.exec(query)
    result.each do |row|
      puts row
    end
  rescue PG::Error => e
    puts "Error while executing the query: #{e.message}"
  ensure
    @connection&.close
  end

  def delete_user_by_id(id)
    query = "DELETE FROM users WHERE id = '#{id}'"
    @connection.exec(query)
    puts 'User is deleted'
  rescue PG::Error => e
    puts "Error while executing the query: #{e.message}"
  ensure
    @connection&.close
  end

  def update_user_name_by_id(id, name)
    query = "UPDATE users SET name = '#{name}' WHERE id = '#{id}'"
    @connection.exec(query)
    puts 'User name is updated'
  rescue PG::Error => e
    puts "Error while executing the query: #{e.message}"
  ensure
    @connection&.close
  end
end
