# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin_email = "admin@admin.com"

User.find_or_create_by!(email: admin_email) do |u|
  u.password = "123123"
  u.password_confirmation = "123123"
  u.role = "admin"
end

puts "Seeded admin at #{admin_email}"
