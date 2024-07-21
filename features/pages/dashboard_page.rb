# Home Page - Page Object Model
require File.join(File.dirname(__FILE__), 'base_page.rb')
require "selenium-webdriver"
require "test/unit"
include Test::Unit::Assertions
class DashboardPage < BasePage

    EXPLORE_HEADER_LOCATOR = "explore-header"
    SNAP_RAISE_CONTAINER_LOCATOR = "snap-raise-container"

    def initialize(driver)
        @driver = super(driver)
        @wait = Selenium::WebDriver::Wait.new(timeout: 30)
    end

    def verify_dashboard
        explore_header_element = @driver.find_element(:id => EXPLORE_HEADER_LOCATOR)
        @wait.until { explore_header_element.displayed? }
        assert(explore_header_element.displayed?)

        snap_raise_container_locator = @driver.find_element(:id => SNAP_RAISE_CONTAINER_LOCATOR)
        @wait.until { snap_raise_container_locator.displayed? }
        assert(snap_raise_container_locator.displayed?)
        assert(snap_raise_container_locator.text.include? 'Transform Your Fundraising')
    end
end