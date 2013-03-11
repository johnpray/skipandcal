source 'https://rubygems.org'

gem 'rails', '~> 3.2.11'
gem 'jquery-rails', '~> 2.0.0'

gem 'will_paginate', '~> 3.0.3' # pagination for index pages
gem 'redcarpet', '~> 2.1.1' # markdown
gem 'cocaine', '0.3.2' # paperclip dependency; later versions break things
gem 'paperclip', '3.0.3' # uploads (for frames)
gem 'aws-sdk', '~> 1.3.4' # storage on Amazon S3
gem 'thin', '~> 1.3.1' # a faster server
gem 'friendly_id', '~> 4.0.1' # friendly urls (names instead of numbers)
gem 'paper_trail', '~> 2.6.3' # track changes and allow undo
gem 'turbolinks', '~> 1.0.0' # add turbolinks
gem 'jquery-turbolinks', '~> 0.2.1' # but don't break jquery

group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.2.3'
  gem 'zurb-foundation', '~> 2.2.1' 
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'capybara'
#  gem 'show_me_the_cookies'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'wdm' # guard needs it on Windows
  gem 'spork'
  gem 'guard-spork'
end

group :production do
  gem 'pg', '~> 0.12.2'
end