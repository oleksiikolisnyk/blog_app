# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(email: 'bob@the.cat', password: 'bobby', role: 1)

tag = Tag.create(title: 'cat')

10.times do
  user = User.create(email: Faker::Internet.email,
                     password: 'fake_user',
                     role: 2)

   5.times do
     post = Post.create(user: user,
                        title: Faker::Lorem.sentence(word_count: 2),
                        body: Faker::Lorem::paragraph(sentence count: 5)
                        tag: tag)

      2.times do
        Comment.create(user: user,
                       post: post,
                       body: Faker::Lorem::paragraph(sentence count: 2))
      end
   end
end
