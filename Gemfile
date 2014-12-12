source 'https://rubygems.org'


# rails
gem 'rails', '4.1.7'
# base de datos
gem 'pg'

# estilos
gem 'sass', '3.2.19'
gem 'compass', '~> 0.12.7'
gem "sprockets", "2.11.0"
gem 'sass-rails'
gem 'autoprefixer-rails'
gem 'bootstrap-sass'
gem 'compass-rails', '~> 1.1.7'

# javascript
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'angular_rails_csrf'
gem "i18n-js"
gem 'bower-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'


# Autentificación, roles y habilidades de usuarios
gem 'devise'
gem 'cancancan'
gem 'rolify'
gem 'markable', github: 'chrome/markable' # favoritos

# subida de imágenes
gem 'carrierwave'
gem 'mini_magick'

# utilización de amazon s3
gem 'figaro'
gem "fog"

# utilidades web
gem "pismo" # capturar metadatos vía url
gem 'meta-tags'

group :development do
  gem 'guard'
  gem 'guard-livereload', require: false # Use live-reload
  gem 'guard-rails'
  gem 'guard-bundler', require: false
  gem 'awesome_print'
  gem "better_errors" # necesita ruby 2.0.0
  gem 'guard-cucumber'
  gem 'erb2haml'
end


group :development, :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'guard-rspec', require: false
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'rspec-core'
  gem 'zeus'
  gem 'guard-zeus'
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'capybara'
end


group :doc do
  gem 'sdoc', '~> 0.4.0'
end


# Use haml
gem 'haml'