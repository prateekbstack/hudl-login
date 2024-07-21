require 'rubygems'
require 'selenium-webdriver'

Before do |scenario|
    # Local execution.
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.timeouts.implicit_wait = 10
    @driver.manage.window.maximize
end

After do |scenario|
    @driver.close
end