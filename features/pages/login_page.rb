# Home Page - Page Object Model
require File.join(File.dirname(__FILE__), 'base_page.rb')
require "selenium-webdriver"
require "test/unit"
include Test::Unit::Assertions
class LoginPage < BasePage

    LOGIN_HEADER_LOCATOR = "#login-box .page-title"
    EMAIL_INPUT_LOCATOR = "email"
    PASSWORD_INPUT_LOCATOR = "password"
    CONTINUE_BUTTON_LOCATOR = "logIn"
    REQUIRED_FIELDS_ERROR_MESSAGE_LOCATOR = "#login-box .uni-notice__content"
    EMAIL_LABEL_LOCATOR = "email-label"
    PASSWORD_LABEL_LOCATOR = "password-label"
    ERROR_RED_COLOR_CODE = "rgba(185, 24, 4, 1)"
    EMAIL_REQUIRED_LOCATOR = "#username-container span"
    PASSWORD_REQUIRED_LOCATOR = "#password-container span"
    INCORRECT_EMAIL_OR_PASSWORD_ERROR_MESSAGE_LOCATOR = "#login-box .error-message"
    FORGOT_PASSWORD_LINK_LOCATOR = "forgot-password"
    FACEBOOK_LOGIN_BUTTON_LOCATOR = "btn-facebook-login"
    GOOGLE_LOGIN_BUTTON_LOCATOR = "btn-google-login"
    APPLE_LOGIN_BUTTON_LOCATOR = "btn-apple-login"
    SIGNUP_BUTTON_LOCATOR = "btn-show-signup"

    def initialize(driver)
        @driver = super(driver)
        @wait = Selenium::WebDriver::Wait.new(timeout: 30)
    end

    def input_email(text)
        email_element = @driver.find_element(:id => EMAIL_INPUT_LOCATOR)
        email_element.click
        email_element.send_keys text
    end

    def input_password(text)
        password_element = @driver.find_element(:id => PASSWORD_INPUT_LOCATOR)
        @wait.until { password_element.displayed? }
        password_element.click
        password_element.send_keys text
    end

    def submit
        @driver.find_element(:id => CONTINUE_BUTTON_LOCATOR).click
    end

    def verify_required_fields_error_message
        error_element = @driver.find_element(:css => REQUIRED_FIELDS_ERROR_MESSAGE_LOCATOR)
        @wait.until { error_element.displayed? }
        assert(error_element.text.eql? 'Please fill in all of the required fields')
    end

    def verify_incorrect_email_or_password_error_message
        error_element = @driver.find_element(:css => INCORRECT_EMAIL_OR_PASSWORD_ERROR_MESSAGE_LOCATOR)
        @wait.until { error_element.displayed? }
        assert(error_element.text.eql? "We don't recognize that email and/or password")
    end

    def verify_red_color_email
        email_label_element = @driver.find_element(:id => EMAIL_LABEL_LOCATOR)
        @wait.until { email_label_element.displayed? }
        assert_equal(email_label_element.css_value('color'), ERROR_RED_COLOR_CODE)
        email_req_element = @driver.find_element(:css => EMAIL_REQUIRED_LOCATOR)
        assert_equal(email_req_element.css_value('color'), ERROR_RED_COLOR_CODE)
        assert_equal(email_req_element.text, 'Required')
    end

    def verify_red_color_password
        password_label_element = @driver.find_element(:id => PASSWORD_LABEL_LOCATOR)
        @wait.until { password_label_element.displayed? }
        assert_equal(password_label_element.css_value('color'), ERROR_RED_COLOR_CODE)
        password_req_element = @driver.find_element(:css => PASSWORD_REQUIRED_LOCATOR)
        assert_equal(password_req_element.css_value('color'), ERROR_RED_COLOR_CODE)
        assert_equal(password_req_element.text, 'Required')
    end

    def click_forgot_password
        forgot_password_link_element = @driver.find_element(:id => FORGOT_PASSWORD_LINK_LOCATOR)
        @wait.until { forgot_password_link_element.displayed? }
        forgot_password_link_element.click
    end

    def click_facebook_login
        facebook_login_element = @driver.find_element(:id => FACEBOOK_LOGIN_BUTTON_LOCATOR)
        @wait.until { facebook_login_element.displayed? }
        facebook_login_element.click
    end

    def click_google_login
        google_login_element = @driver.find_element(:id => GOOGLE_LOGIN_BUTTON_LOCATOR)
        @wait.until { google_login_element.displayed? }
        google_login_element.click
    end

    def click_apple_login
        apple_login_element = @driver.find_element(:id => APPLE_LOGIN_BUTTON_LOCATOR)
        @wait.until { apple_login_element.displayed? }
        apple_login_element.click
    end

    def click_signup_button
       signup_element = @driver.find_element(:id => SIGNUP_BUTTON_LOCATOR)
        @wait.until { signup_element.displayed? }
        signup_element.click
    end
end