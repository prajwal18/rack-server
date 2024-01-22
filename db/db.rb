require 'pg'
# Accessing Environment variables
require 'dotenv'
Dotenv.load('.env')
# Accessing Environment variables

# For Db connection
class Db
  def initialize
    # Configuration database connection
    @db_params = {
      host: ENV['DB_HOST'],
      port: ENV['DB_PORT'],
      dbname: ENV['DB_NAME'],
      user: ENV['DB_USERNAME'],
      password: ENV['DB_PASSWORD']
    }
  end

  def connection
    PG.connect(@db_params)
  end
end
