# Load the food_items SQL file
sql_file = File.read('db/data/food_items.sql')

# Execute the SQL file
ActiveRecord::Base.connection.execute(sql_file)
