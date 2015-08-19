source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '~> 4.2.0'
gem 'thin'
gem 'pg'
gem 'devise'
gem 'omniauth'
gem 'omniauth-openid'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'
gem 'omniauth-linkedin-oauth2'
gem 'rolify'
gem 'cancancan'
gem 'activeadmin', '~> 1.0.0.pre'
gem 'draper'
gem 'rollbar'
gem 'newrelic_rpm'
gem 'roadie-rails'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'autoprefixer-rails'
  gem 'uglifier', '>= 1.3.0'
  gem 'turbolinks'

  source 'https://rails-assets.org' do
    gem 'rails-assets-jquery', '~> 1.10.0' # due to jquery 1.10 version required by jquery-rails < 4.0
    gem 'rails-assets-jquery-ui', '~> 1.10.0'
    gem 'rails-assets-jquery-ujs', '~> 1.0.4'
    gem 'rails-assets-jquery-cookie', '~> 1.4.1'
    gem 'rails-assets-jquery-minicolors', '~> 2.1.12'
    gem 'rails-assets-jquery-flot', '~> 0.8.3'
    gem 'rails-assets-jquery-validate', '~> 1.11.1'
    gem 'rails-assets-jquery-maskedinput', '~> 1.4.1'
    gem 'rails-assets-jquery-raty', '~> 2.7.0'
    gem 'rails-assets-ink', '~> 1.0.5'
    gem 'rails-assets-bootstrap', '~> 3.3.5'
    gem 'rails-assets-font-awesome', '~> 4.3.0'
    gem 'rails-assets-ionicons', '~> 2.0.1'
    gem 'rails-assets-selectize', '~> 0.12.1'
    gem 'rails-assets-select2', '~> 3.4.5'
    gem 'rails-assets-jstz-detect', '~> 1.0.5'
    gem 'rails-assets-messenger', '~> 1.4.2'
    gem 'rails-assets-datatables', '~> 1.10.7'
    gem 'rails-assets-datatables-plugins', '~> 1.10.7'
    gem 'rails-assets-flot.tooltip', '~> 0.8.3'
    gem 'rails-assets-tether-shepherd', '~> 0.5.1'
    gem 'rails-assets-animate-css', '~> 3.3.0'
    gem 'rails-assets-fullcalendar', '~> 1.6.1'
    gem 'rails-assets-offline', '~> 0.7.13'
    gem 'rails-assets-moment', '~> 2.5.1'
    gem 'rails-assets-highlightjs', '~> 8.6'
    gem 'rails-assets-zoomerang', '~> 0.1.8'
    gem 'rails-assets-summernote', '~> 0.6.10'
    gem 'rails-assets-bootstrap-switch', '~> 3.1.0'
    gem 'rails-assets-bootstrap-datepicker', '~> 1.4.0'
    gem 'rails-assets-bootstrap-daterangepicker', '~> 1.3.6'
  end
end

group :development, :test do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'byebug'
  gem 'pry'
  gem 'hirb', require: false
end

group :development do
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
end

group :test do
  gem 'minitest-rails'
  gem 'minitest-reporters'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
end
