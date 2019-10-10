# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{name: 'Pam', username: 'artistwhocodes', user_img: 'None', password_digest: 'password'}, {name: 'Christian', username: 'grimmzsoul', user_img: 'None', password_digest: 'word'} ] )
posts = Post.create(title: 'Hello, world!', content: 'Today and yesterday my mood wasnt great. i wish i created this app sooner.', post_img: "none", user: users.first )
tags = Tag.create(tag_name: 'first post')
