# Home Page - Page Object Model
require File.join(File.dirname(__FILE__), 'base_page.rb')
require "selenium-webdriver"
require "test/unit"
include Test::Unit::Assertions
class FanDashboardPage < BasePage

    SEARCH_INPUT_LOCATOR = "#search-bar input"
    SEARCH_SUBTEXT_LOCATOR = "[data-qa-id='spotlight-text']"

    def initialize(driver)
        @driver = super(driver)
        @wait = Selenium::WebDriver::Wait.new(timeout: 30)
    end

    def verify_fan_dashboard
        search_input_element = @driver.find_element(:css => SEARCH_INPUT_LOCATOR)
        @wait.until { search_input_element.displayed? }
        assert(search_input_element.displayed?)

        search_subtext_locator = @driver.find_element(:css => SEARCH_SUBTEXT_LOCATOR)
        @wait.until { search_subtext_locator.displayed? }
        assert(search_subtext_locator.displayed?)
        assert(search_subtext_locator.text.include? 'Find livestreams, highlights, squads, and more.')
    end
end