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
