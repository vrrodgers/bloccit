 source 'https://rubygems.org'
 
 git_source(:github) do |repo_name|
   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
   "https://github.com/#{repo_name}.git"
 end
 
 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
 gem 'rails', '~> 5.1.2'
 
 # #1
 group :production do
   # Use pg as the production database for Active Record
   gem 'pg'
   gem 'rails_12factor'
 end
 
 # #2
 group :development do
   # Use sqlite3 as the development database for Active Record
   gem 'sqlite3'
 end
 
 # Use Puma as the app server
 gem 'puma', '~> 3.0'
 # Use SCSS for stylesheets
 gem 'sass-rails', '~> 5.0'
 # Use Uglifier as compressor for JavaScript assets
 gem 'uglifier', '>= 1.3.0'
 
 # Use jquery as the JavaScript library
 gem 'jquery-rails'
 # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
 gem 'turbolinks', '~> 5'
 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
 gem 'jbuilder', '~> 2.5'
 
 gem 'thor', '0.19.1'
 gem 'bootstrap', '~> 4.1', '>= 4.1.3'
 gem 'figaro', '1.0'
 gem 'dotenv', '~> 2.5'
 # Used for encrypting passwords
 gem 'bcrypt'
 gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'

 group :development do
   gem 'listen', '~> 3.0.5'
 end
 gem 'pry-rails', :group => :development


  group :development, :test do
   gem 'rspec-rails', '~> 3.0'
   gem 'rails-controller-testing'
   gem 'shoulda' 
   gem 'factory_girl_rails', '~> 4.0'

 end