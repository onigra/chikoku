source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'mysql2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'
gem 'active_model_serializers'

gem "slim-rails", github: "slim-template/slim-rails"

gem "httparty"
gem "omniauth"
gem "omniauth-twitter"

# gem 'unicorn'

group :development do
  # gem "capistrano"
  # gem "capistrano-bundler"
  # gem "capistrano-rbenv"
  # gem "capistrano-rails"
  # gem "capistrano3-unicorn"

  gem "guard"
  gem "guard-rails"
  gem "guard-rspec"
  gem "growl"
  gem "annotate", github: "ctran/annotate_models"
end

group :development, :test do
  gem "byebug"
  gem "web-console", "~> 2.0"
  gem "awesome_print"

  gem "rspec-rails"
  gem "spring"
  gem "spring-commands-rspec"

  gem "timecop"
  gem "factory_girl_rails"
  gem "bullet"
  gem "faker"

  gem "pry-rails"
  gem "pry-byebug"
  gem "pry-stack_explorer"
  gem "pry-remote"
  gem "pry-doc"
end

group :test do
  gem "database_rewinder"
end
