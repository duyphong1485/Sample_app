source "https://rubygems.org"

git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.0"

gem "rails", "~> 6.1.4", ">= 6.1.4.1"

gem "i18n", "~> 1.8", ">= 1.8.10"

gem "bcrypt", "~> 3.1", ">= 3.1.16"

gem "config"

gem "sqlite3", "~> 1.4"

gem "bootstrap-will_paginate", "~> 1.0"

gem "faker", "~> 1.6", ">= 1.6.6"

gem "will_paginate", "~> 3.1", ">= 3.1.8"

gem "puma", "~> 5.0"

gem "sass-rails", ">= 6"

gem "webpacker", "~> 5.0"

gem "turbolinks", "~> 5"

gem "jbuilder", "~> 2.7"

gem "bootsnap", ">= 1.4.4", require: false

gem "bootstrap-sass", "~> 3.4", ">= 3.4.1"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "rack-mini-profiler", "~> 2.0"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
end
