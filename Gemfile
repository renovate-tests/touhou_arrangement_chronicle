source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

gem 'rails', '~> 5.2.0'

gem 'bootsnap'
gem 'hamlit-rails'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'sorcery'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

group :development do
  gem 'annotate'
  gem 'byebug', platform: :mri, group: :test
  gem 'listen'
  gem 'onkcop', require: false
  gem 'overcommit', require: false
  gem 'pry', group: :test
  gem 'pry-byebug', group: :test
  gem 'pry-doc', group: :test
  gem 'pry-rails', group: :test
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'factory_bot_rails', group: :development
  gem 'rspec-rails', group: :development
end
