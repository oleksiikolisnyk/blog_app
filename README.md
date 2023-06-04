# README

1. To run the app, install dependencies ruby version '2.7.6', rails version '6.0.0', Postgresql version '9.6'
2. Seed run `rake db:create`, `rake db:migrate`, `rake db:seed` to seed the database
3. Run the BE of the application by the command `rails server` in application directory 
(post 3000 will bee used by default)
4. Run the FE of the application by the command `yarn start` in frontend directory of the application
(post 3001 will bee used by default)
5. The applocation has no FE so we can sign up and sign in an use, but until we are waiting for FE the user is hardcoded,
    for testing purposes
7. To use tests run the command `bundle exec rspec spec`. It will run tests `Sign up`, `Sign in` for users and for the `blog creation`.
