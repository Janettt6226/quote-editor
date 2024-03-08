
puts "\n== Seeding the database with fixtures =="
system("bin/rails db:fixtures:load")

# If you like using fixtures for your tests, you may know that instead of running bin/rails db:seed you can run bin/rails db:fixtures:load to create development data from your fixtures files. Let's tell Rails that the two commands are equivalent in the db/seeds.rb file:
