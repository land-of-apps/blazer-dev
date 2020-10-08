require 'capybara'
require 'selenium/webdriver'
require 'capybara/cucumber'

Capybara.default_max_wait_time = 30
Capybara.default_driver = :selenium
Capybara.run_server = false
