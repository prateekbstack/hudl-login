# Home Page - Page Object Model
require File.join(File.dirname(__FILE__), 'base_page.rb')
require "selenium-webdriver"
require "test/unit"
include Test::Unit::Assertions
class ForgotPassWordPage < BasePage

    FORGOT_PASSWORD_HEADER_LOCATOR = "#reset-box .page-title"
    FORGOT_PASSWORD_HELP_TEXT_LOCATOR = "email-reset-help"
    BACK_TO_LOGIN_BUTTON_LOCATOR = "#reset-page .btn-back-login"
    LOGIN_TOP_RIGHT_BUTTON = "nav-btn-page"
    EMAIL_INPUT_LOCATOR = "email-reset"
    CONTINUE_BUTTON_LOCATOR = "btn-reset"
    INVALID_EMAIL_ERROR_MESSAGE_LOCATOR = "#reset-box .error-message"
    EMAIL_CONFIRMATION_MESSAGE_BOX_LOCATOR = "reset-confirmation-hudl-box"
    REQUIRED_FIELDS_ERROR_MESSAGE_LOCATOR = "#reset-box .uni-notice__content"

    def initialize(driver)
        @driver = super(driver)
        @wait = Selenium::WebDriver::Wait.new(timeout: 30)
    end

    def verify_forgot_password_page_elements
        verify_header
        verify_help_text
        verify_back_to_login_button
        verify_top_right_login_button
    end

    def verify_header
        header_element = @driver.find_element(:css => FORGOT_PASSWORD_HEADER_LOCATOR)
        @wait.until { header_element.displayed? }
        assert_equal(header_element.text, 'Forgot Password')
    end

    def verify_help_text
        help_text_element = @driver.find_element(:id => FORGOT_PASSWORD_HELP_TEXT_LOCATOR)
        @wait.until { help_text_element.displayed? }
        assert_equal(help_text_element.text, "We need to verify it's you. You'll receive an email with a verification code to reset your password.")
    end

    def verify_back_to_login_button
        back_button = @driver.find_element(:css => BACK_TO_LOGIN_BUTTON_LOCATOR)
        @wait.until { back_button.displayed? }
        assert_equal(back_button.text, "Back to Log In")
    end

    def verify_top_right_login_button
        login_button = @driver.find_element(:id => LOGIN_TOP_RIGHT_BUTTON)
        @wait.until { login_button.displayed? }
        assert_equal(login_button.text, "Log In")
    end

    def input_email(text)
        email_element = @driver.find_element(:id => EMAIL_INPUT_LOCATOR)
        email_element.click
        email_element.send_keys text
    end

    def submit
        @driver.find_element(:id => CONTINUE_BUTTON_LOCATOR).click
    end

    def verify_invalid_email_error_message
        error_element = @driver.find_element(:css => INVALID_EMAIL_ERROR_MESSAGE_LOCATOR)
        @wait.until { error_element.displayed? }
        assert_equal(error_element.text, "Please enter a valid email address")
    end

    def verify_email_confirmation_screen
        confirmation_box_element = @driver.find_element(:id => EMAIL_CONFIRMATION_MESSAGE_BOX_LOCATOR)
        @wait.until { confirmation_box_element.displayed? }
        assert(confirmation_box_element.text.include? "Check Your Email")
        assert(confirmation_box_element.text.include? "If you have an account, a reset password link has been sent to your email.")
    end

    def verify_required_fields_error_message
        error_element = @driver.find_element(:css => REQUIRED_FIELDS_ERROR_MESSAGE_LOCATOR)
        @wait.until { error_element.displayed? }
        assert(error_element.text.eql? 'Please fill in the required field')
    end
end