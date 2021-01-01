# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationRecord.transaction do
  Admin.find_or_create_by!(nama: "administrator")
  User.where(username: "admin").first_or_create! do |user|
    user.email = "admin@domain.tld"
    user.password = "changeme123"
    user.authenticatable = Admin.find_by(nama: "administrator")
  end
end
