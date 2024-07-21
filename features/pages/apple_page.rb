# Home Page - Page Object Model
require File.join(File.dirname(__FILE__), 'base_page.rb')
require "selenium-webdriver"
require "test/unit"
include Test::Unit::Assertions
class ApplePage < BasePage

    EMAIL_INPUT_LOCATOR = "account_name_text_field"

    def initialize(driver)
        @driver = super(driver)
        @wait = Selenium::WebDriver::Wait.new(timeout: 30)
    end

    def verify_apple_login_input
        email_element = @driver.find_element(:id => EMAIL_INPUT_LOCATOR)
        @wait.until { email_element.displayed? }
        assert(email_element.displayed?)
    end
end