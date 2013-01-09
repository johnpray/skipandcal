source 'https://rubygems.org'

gem 'rails', '~> 3.2.11'
gem 'jquery-rails', '~> 2.0.0'

gem 'will_paginate', '~> 3.0.3' # pagination for index pages
gem 'redcarpet', '~> 2.1.1' # markdown
gem 'cocaine', '0.3.2' # paperclip dependency; later versions break things
gem 'paperclip', '3.0.3' # uploads
gem 'aws-sdk', '~> 1.3.4' # storage
gem 'thin', '~> 1.3.1' # faster server
gem 'friendly_id', '~> 4.0.1' # friendly urls
gem 'paper_trail', '~> 2.6.3' # track changes and allow undo

group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.2.3'
  gem 'zurb-foundation', '~> 2.2.1' 
end

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg', '~> 0.12.2'
end