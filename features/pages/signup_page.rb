# Home Page - Page Object Model
require File.join(File.dirname(__FILE__), 'base_page.rb')
require "selenium-webdriver"
require "test/unit"
include Test::Unit::Assertions
class SignupPage < BasePage

    SIGNUP_HEADER_LOCATOR = "#signup-box .page-title"
    FIRST_NAME_INPUT_LOCATOR = "first-name"
    LAST_NAME_INPUT_LOCATOR = "last-name"
    EMAIL_INPUT_LOCATOR = "email-signup"
    PASSWORD_INPUT_LOCATOR = "password-signup"
    PASSWORD_CONFIRM_INPUT_LOCATOR = "password-confirm"
    CREATE_ACCOUNT_BUTTON = "btn-signup"
    EMAIL_LABEL_LOCATOR = "#email-signup-container label"
    EMAIL_REQUIRED_LOCATOR = "#email-signup-container span"
    REQUIRED_FIELDS_ERROR_MESSAGE_LOCATOR = "#signup-box .error-message"
    TOP_RIGHT_LOGIN_BUTTON_LOCATOR = "nav-btn-page"
    TC_CONTAINER_LOCATOR = ".terms-signup-container"
    BOTTOM_LOGIN_BUTTON_LOCATOR = "btn-show-login"
    SIGNUP_ERROR_MESSAGE_LOCATOR = "#signup-box .error-message"

    def initialize(driver)
        @driver = super(driver)
        @wait = Selenium::WebDriver::Wait.new(timeout: 30)
    end

    def verify_signup_page_elements
        verify_header
        verify_top_right_login_button
        verify_tc_text
        verify_bottom_login_button
    end

    def verify_header
        header_element = @driver.find_element(:css => SIGNUP_HEADER_LOCATOR)
        @wait.until { header_element.displayed? }
        assert_equal(header_element.text, SIGNUP_HEADER_OR_BUTTON_TEXT)
    end

    def verify_top_right_login_button
        tr_login_element = @driver.find_element(:id => TOP_RIGHT_LOGIN_BUTTON_LOCATOR)
        @wait.until { tr_login_element.displayed? }
        assert_equal(tr_login_element.text, LOGIN_HEADER_OR_BUTTON_TEXT)
    end

    def verify_tc_text
        tc_element = @driver.find_element(:css => TC_CONTAINER_LOCATOR)
        @wait.until { tc_element.displayed? }
        assert_equal(tc_element.text, TC_TEXT)
    end

    def verify_bottom_login_button
        bottom_login_element = @driver.find_element(:id => BOTTOM_LOGIN_BUTTON_LOCATOR)
        @wait.until { bottom_login_element.displayed? }
        assert_equal(bottom_login_element.text, LOGIN_HEADER_OR_BUTTON_TEXT)
    end

    def input_first_name(text)
        first_name_element = @driver.find_element(:id => FIRST_NAME_INPUT_LOCATOR)
        first_name_element.click
        first_name_element.send_keys text
    end

    def input_last_name(text)
        last_name_element = @driver.find_element(:id => LAST_NAME_INPUT_LOCATOR)
        last_name_element.click
        last_name_element.send_keys text
    end

    def input_email(text)
        email_element = @driver.find_element(:id => EMAIL_INPUT_LOCATOR)
        email_element.click
        email_element.send_keys text
    end

    def generate_random_email
        random_string = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
        "#{random_string}@abc.com"
    end

    def input_random_email
        email = generate_random_email
        input_email(email)
    end

    def input_password(text)
        password_element = @driver.find_element(:id => PASSWORD_INPUT_LOCATOR)
        password_element.click
        password_element.send_keys text
    end

    def input_confirm_password(text)
        password_confirm_element = @driver.find_element(:id => PASSWORD_CONFIRM_INPUT_LOCATOR)
        password_confirm_element.click
        password_confirm_element.send_keys text
    end

    def submit
        @driver.find_element(:id => CREATE_ACCOUNT_BUTTON).click
    end

    def verify_red_color_email
        email_label_element = @driver.find_element(:css => EMAIL_LABEL_LOCATOR)
        @wait.until { email_label_element.displayed? }
        assert_equal(email_label_element.css_value('color'), ERROR_RED_COLOR_CODE)
        email_req_element = @driver.find_element(:css => EMAIL_REQUIRED_LOCATOR)
        assert_equal(email_req_element.css_value('color'), ERROR_RED_COLOR_CODE)
        assert_equal(email_req_element.text, 'Required')
    end

    def verify_required_fields_error_message
        error_element = @driver.find_element(:css => REQUIRED_FIELDS_ERROR_MESSAGE_LOCATOR)
        @wait.until { error_element.displayed? }
        assert(error_element.text.eql? REQUIRED_FIELDS_ERROR_MSG_LOGIN_SIGNUP)
    end

    def verify_signup_errors
        signup_error_elements = @driver.find_element(:css => SIGNUP_ERROR_MESSAGE_LOCATOR)
        @wait.until { signup_error_elements.displayed? }
        assert(signup_error_elements.text.include? PASSWORD_CRITERIA_NOT_MET_ERROR)
        assert(signup_error_elements.text.include? PASSWORD_MISMATCH_ERROR)
    end
end