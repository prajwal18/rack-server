# frozen_string_literal: true

require_relative './db'

# Creating object of DB class which is located on database folder and in db.rb file
db = Db.new
connection = db.connection

# Query for creating user table
query_for_creating_user_table = 'CREATE TABLE IF NOT EXISTS users(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  age INT,
  PRIMARY KEY(id)
)'

# Query for creating customer table
query_for_creating_customer_table = 'CREATE TABLE IF NOT EXISTS customers(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(50) UNIQUE,
  user_id INT,
  CONSTRAINT fk_users
    FOREIGN KEY (user_id)
      REFERENCES users(id)
        ON DELETE CASCADE
          ON UPDATE CASCADE
)'

# Execute the query
connection.exec(query_for_creating_user_table)
connection.exec(query_for_creating_customer_table)

# Close the connection when done
connection.close
