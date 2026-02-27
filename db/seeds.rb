# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by!(email: "test@homey.co.uk") do |u|
  u.password = "Password123!"
end

project = Project.find_or_create_by!(name: "Demo Project") do |p|
  p.status = "new"
end

project.conversation_items.find_or_create_by!(
  type: "CommentItem",
  user: user,
  body: "Welcome to the project conversation history."
)
