source 'https://rubygems.org'
ruby '2.1.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.0.5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'faker', '~> 1.5.0'

gem 'bootstrap-sass', '~> 3.3.5' # CSS framework
gem 'simple_form', '~> 3.2.0' # Form builders
gem 'kaminari', '~> 0.16.3' # Pagination
gem 'font-awesome-sass', '~> 4.4.0' # Web icon font
gem 'rails_autolink', '~> 1.1.6' # Link in text
gem 'momentjs-rails', '~> 2.10.6' # Datepicker
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37' # Datepicker
gem 'roo', '~> 2.1.1' # Read spreadsheet
#gem 'jquery-datatables-rails', '~> 3.3.0' # Sortable table
gem 'jquery-datatables-rails', github: "rweng/jquery-datatables-rails", branch: "master"

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '1.3.10'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '6.0.2'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.3.6'

  gem 'rspec-rails', '~> 3.3.3'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'guard-rspec', '~> 4.6.4', require: false
  gem 'annotate', '~> 2.6.10'
  gem 'rails-erd', '~> 1.4.4' # ERD (rake filename)(open filename.pdf)
  gem 'quiet_assets', '~> 1.1.0'
end

group :test do
  gem 'capybara', '~> 2.5.0'
  gem 'launchy', '~> 2.4.3'
  gem 'selenium-webdriver', '~> 2.48.1'
end

group :production do
  # Use Heroku for production environment
  gem 'pg'
  gem 'rails_12factor'
end
