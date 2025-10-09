# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create test users
puts "Creating users..."

User.find_or_create_by!(username: "admin") do |user|
  user.password = "admin123"
  user.password_confirmation = "admin123"
  user.role = "admin"
end
puts "✓ Admin user created (username: admin, password: admin123)"

User.find_or_create_by!(username: "user1") do |user|
  user.password = "password1"
  user.password_confirmation = "password1"
  user.role = "user"
end
puts "✓ User 1 created (username: user1, password: password1)"

User.find_or_create_by!(username: "user2") do |user|
  user.password = "password2"
  user.password_confirmation = "password2"
  user.role = "user"
end
puts "✓ User 2 created (username: user2, password: password2)"

User.find_or_create_by!(username: "user3") do |user|
  user.password = "password3"
  user.password_confirmation = "password3"
  user.role = "user"
end
puts "✓ User 3 created (username: user3, password: password3)"

puts "\nSeeding completed! Total users: #{User.count}"
