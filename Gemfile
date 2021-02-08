source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'bootstrap-will_paginate', '~> 1.0'
gem 'carrierwave', '~> 1.3'
gem 'coffee-rails', '~> 4.2'
gem 'faker', '~> 1.9', '>= 1.9.3'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'mini_magick', '~> 4.9', '>= 4.9.3'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'guard', '~> 2.15'
  gem 'guard-minitest', '~> 2.4', '>= 2.4.6'
  gem 'minitest', '~> 5.8', '>= 5.8.4'
  gem 'minitest-reporters', '~> 1.3', '>= 1.3.6'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.4'
end

group :production do
  gem 'fog', '~> 2.1'
  gem 'pg', '>= 0.18', '< 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
