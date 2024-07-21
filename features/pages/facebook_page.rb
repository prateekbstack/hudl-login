# Home Page - Page Object Model
require File.join(File.dirname(__FILE__), 'base_page.rb')
require "selenium-webdriver"
require "test/unit"
include Test::Unit::Assertions
class FacebookPage < BasePage

    LOGIN_HEADER_LOCATOR = "header_block"

    def initialize(driver)
        @driver = super(driver)
        @wait = Selenium::WebDriver::Wait.new(timeout: 30)
    end

    def verify_facebook_login_header
        header_element = @driver.find_element(:id => LOGIN_HEADER_LOCATOR)
        @wait.until { header_element.displayed? }
        assert_equal(header_element.text, 'Log in to Facebook')
    end
end