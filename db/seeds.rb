admin = User.create(name: 'bob', email: 'bob@the.cat', password: 'tacethbob', role: 'admin')

tag = Tag.create(title: 'cat')

10.times do
  user = User.create(name: Faker::Name.female_first_name,
                     email: Faker::Internet.email,
                     password: 'fake_user',
                     role: 2)

  blog = Blog.create(title: Faker::Name.female_first_name,
                     description: Faker::Lorem.sentence(word_count: 2),
                     user: user)
   5.times do
     post = Post.create(user: user,
                        blog: blog,
                        title: Faker::Lorem.sentence(word_count: 2),
                        body: Faker::Lorem::paragraph(sentence_count: 5),
                        tags: [tag])

      2.times do
        Comment.create(user: user,
                       post: post,
                       body: Faker::Lorem::paragraph(sentence_count: 2))
      end
   end
end
