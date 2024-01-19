# frozen_string_literal: true

require 'pg'

# For Db connection
class Db
  def initialize
    # Configuration database connection
    @db_params = {
      host: 'localhost',
      port: 5432,
      dbname: 'user_customer',
      user: 'unesh',
      password: ''
    }
  end

  def connection
    PG.connect(@db_params)
  end
end

# db = Db.new
# conn = db.connection

# result = conn.exec('SELECT version()')

# puts result[0]

# Configuration database connection
# db_params = {
#   host: 'localhost',
#   port: 5432,
#   dbname: 'user_customer',
#   user: 'unesh',
#   password: ''
# }

# Established a connection to the database
# conn = PG.connect(db_params)

# Execute a query to create table User and Customer
# result = conn.exec('SELECT version()')
# puts "PostgreSQL version: #{result[0]['version']}"

# Close the connection when done
# conn.close
