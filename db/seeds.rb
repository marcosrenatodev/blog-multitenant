# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb
pierre = Tenant.create!(name: "Pierre Adv.", domain: "pierre.com",
                        site_title: "Dr. Pierre", default_description: "Advogado tributarista")

marcia = Tenant.create!(name: "Márcia Adv.", domain: "marcia.com",
                        site_title: "Dra. Márcia", default_description: "Direito de família")

User.create!(tenant: pierre, email: "admin@pierre.com",
             password: "password", role: :admin)

User.create!(tenant: marcia, email: "admin@marcia.com",
             password: "password", role: :admin)
