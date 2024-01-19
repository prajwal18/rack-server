require '../database/db'

# Creating object of DB class which is located on database folder and in db.rb file
db = Db.new
connection = db.connection

# Query for creating user table
query_for_creating_user_table = 'CREATE TABLE IF NOT EXISTS users(
  user_id INT GENERATED ALWAYS AS IDENTITY,
  user_name VARCHAR(255) NOT NULL,
  user_age INT,
  PRIMARY KEY(user_id)
)'

# Query for creating customer table
query_for_creating_customer_table = 'CREATE TABLE IF NOT EXISTS customers(
  customer_id INT GENERATED ALWAYS AS IDENTITY,
  customer_name VARCHAR(255) NOT NULL,
  customer_email VARCHAR(50) UNIQUE,
  user_id INT,
  CONSTRAINT fk_users
    FOREIGN KEY (user_id)
      REFERENCES users(user_id)
)'

# Execute the query
connection.exec(query_for_creating_user_table)
connection.exec(query_for_creating_customer_table)

# Close the connection when done
connection.close
