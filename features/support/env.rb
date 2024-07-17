require 'cucumber'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'rubygems'
require 'pry'
require 'site_prism'
require 'yaml'
require 'rspec'
require 'rspec/core'
require 'rspec/expectations'
require 'report_builder'
require 'faker'
require 'fileutils'
require 'date'
require_relative 'html_logger'

ENV['NO_PROXY'] = "127.0.0.1"
include RSpec::Matchers

# Arquivo de definição de ambiente definitions
DEBUG = ENV['DEBUG'] || false
ENV['ENV'] = 'hml' unless ENV.has_key?('ENV')
ENVIRONMENT = YAML.load_file('./config/environment.yml')[ENV['ENV']]

# Arquivo com os logins para autenticação
AUTH = YAML.load_file('./config/authentication.yml')[ENV['ENV']]

Capybara.javascript_driver = :chrome

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 10
end

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--start-maximized")
  options.add_argument('--incognito')
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--incognito')
  options.add_argument("--window-size=1500,600")
  options.add_argument("--start-maximized")
  options.add_argument("--disable-web-security")
  options.add_argument("--disable-dev-shm-usage")
  options.add_argument("--no-sandbox")
  options.add_argument("--disable-infobars")
  options.add_argument("--disable-notifications")
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.default_driver = :chrome
# Executa sem subir o navegador :headless_chrome
# Executa com Firefox :selenium
# Executa com o Chrome :chrome
# Capybara.ignore_hidden_elements = false