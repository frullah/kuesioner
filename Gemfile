source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.3", ">= 6.0.3.4"
# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"
# Use Puma as the app server
gem "puma", "~> 4.1"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "factory_bot_rails"
  gem "rspec-rails", "~> 4.0.1"
  gem "ruby_jard", "~> 0.3.1"

  gem "shoulda-matchers", "~> 4.4"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  gem "guard-rspec", require: false
  gem "guard-livereload", "~> 2.5.2", require: false
  gem "rack-livereload"
  gem "spring-commands-parallel-tests", require: false
  gem "spring-commands-rspec", require: false
  gem "standard"
  gem "spring-commands-standard", require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
  # add #save_and_open_screenshot support to Capybara
  gem "launchy"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "webpacker", "~> 5"

gem "devise"

gem "bootstrap_form", "~> 4.5"

gem "rails-i18n", "~> 6.0"

gem "devise-i18n", "~> 1.9"

gem "octicons_helper", "~> 11.2"

gem "simple_active_link_to", "~> 1.0"

gem "rails-controller-testing", "~> 1.0"

gem "i18n_generators", "~> 2.2"

gem "turbolinks_render", "~> 0.9.20"

gem "kaminari", "~> 1.2"
