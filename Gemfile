source 'https://rubygems.org'

gemspec

group :profile do
  gem 'bluecloth'
  gem 'rdiscount'
  gem 'ruby-prof', require: false
end

group :development do
  gem 'rubocop'
end

group :test do
  gem 'danger', require: false
  gem 'danger-rubocop', require: false
  gem 'rspec'
end

group :development, :profile, :test do
  gem 'pry-byebug'
end
