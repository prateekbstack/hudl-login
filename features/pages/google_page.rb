# Home Page - Page Object Model
require File.join(File.dirname(__FILE__), 'base_page.rb')
require "selenium-webdriver"
require "test/unit"
include Test::Unit::Assertions
class GooglePage < BasePage

    EMAIL_INPUT_LOCATOR = "identifierId"

    def initialize(driver)
        @driver = super(driver)
        @wait = Selenium::WebDriver::Wait.new(timeout: 30)
    end

    def verify_google_login_input
        email_element = @driver.find_element(:id => EMAIL_INPUT_LOCATOR)
        @wait.until { email_element.displayed? }
        assert(email_element.displayed?)
    end
end