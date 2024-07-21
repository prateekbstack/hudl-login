# Base Page - Page Object Model
require "selenium-webdriver"
require "test/unit"
class BasePage
    include WebDriverHelper
    def initialize(driver)
        @wait = Selenium::WebDriver::Wait.new(timeout: 30)
        @driver = driver
    end

    def refresh_page
        @driver.navigate.refresh
    end

    def navigate_back
        @driver.navigate.back
    end
   end