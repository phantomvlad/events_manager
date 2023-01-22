source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "sqlite3", "~> 1.4"
gem "devise"
gem "devise-i18n"
gem "rails-i18n"
gem "image_processing", ">= 1.2"
gem "aws-sdk-s3", require: false
gem 'active_storage_validations'
gem "recaptcha", require: "recaptcha/rails"
gem 'jquery-rails'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "letter_opener"
  gem "web-console"
end

group :production do
  gem "pg"
end

