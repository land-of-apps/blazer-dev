require "appmap/cucumber"

require "capybara"
require "selenium/webdriver"
require "capybara/cucumber"
require "webdrivers"

Capybara.default_max_wait_time = 10
Capybara.default_driver = :selenium_chrome
Capybara.run_server = false

# What is proper way to do this?
Capybara.app_host = "http://localhost:3000"
