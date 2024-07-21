# Home Page - Page Object Model
require File.join(File.dirname(__FILE__), 'base_page.rb')
require "selenium-webdriver"
require "test/unit"
include Test::Unit::Assertions
class HomePage < BasePage

    LOGIN_DROPDOWN_LOCATOR = "[data-qa-id='login-select']"
    LOGIN_HUDL_OPTION_LOCATOR = "[data-qa-id='login-hudl']"

    def initialize(driver)
        @driver = super(driver)
        @wait = Selenium::WebDriver::Wait.new(timeout: 30)
    end

    def load_homepage
        @driver.navigate.to "https://www.hudl.com/"
    end

    def select_hudl_login
        login_element = @driver.find_element(:css => LOGIN_DROPDOWN_LOCATOR)
        @wait.until { login_element.displayed? }
        login_element.click
        
        login_hudl_option = @driver.find_element(:css => LOGIN_HUDL_OPTION_LOCATOR)
        @wait.until { login_hudl_option.displayed? }
        login_hudl_option.click
    end
end