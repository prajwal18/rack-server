require 'pg'

# Configuration database connection
db_params = {
  host: 'localhost',
  port: 5432,
  dbname: 'user_customer',
  user: 'unesh',
  password: ''
}

# Established a connection to the database
conn = PG.connect(db_params)

# Execute a simple query
result = conn.exec('SELECT version()')
puts "PostgreSQL version: #{result[0]['version']}"

# Close the connection when done
conn.close
