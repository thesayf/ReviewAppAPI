# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)m

ActiveRecord::Base.transaction do
  user = User.first_or_create! email: 'ladi@gmail.com'
  3.times do |num|
    post = Post.find_or_create_by user_id: user.id, title: "Ruby #{num}", longitude: num, latitude: num
    tag = Tag.find_or_create_by name: "tag #{num}"
    Tagging.find_or_create_by! tag_id: tag.id, post_id: post.id
  end
end