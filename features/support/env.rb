require "appmap/cucumber"

require "capybara"
require "selenium/webdriver"
require "capybara/cucumber"
require "webdrivers"

Capybara.default_max_wait_time = 20
Capybara.default_driver = :selenium_chrome
Capybara.run_server = false
Capybara.app_host = "http://localhost:3000"
