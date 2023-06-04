source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'graphql', '~> 1.9'
gem 'bcrypt', '~> 3.1.13'
gem 'graphql-pagination', '~> 1.1'
gem 'kaminari-activerecord'
gem 'rack-cors'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', '~> 1.51'
  gem 'pry', '~> 0.14.2'
  gem 'faker', '~> 3.2'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.4'
  gem 'database_cleaner-active_record'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'graphiql-rails', '~> 1.9'
end
