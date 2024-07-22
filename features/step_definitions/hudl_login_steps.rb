Given(/^I open the Hudl website$/) do
    @home_page ||= HomePage.new(@driver)
    @home_page.load_homepage
end

And(/^I select login for Hudl$/) do
    @home_page ||= HomePage.new(@driver)
    @home_page.select_hudl_login
end

Then(/^I input the correct email$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.input_email('prateekmb21@gmail.com')
end

And(/^I input the correct password$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.input_password('Expo@123')  #This is not the real password. Please contact Prateek Bhiwapurkar for the actual password
end

Then(/^I input empty email$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.input_email('')
end

And(/^I input empty password$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.input_password('')
end

Then(/^I input incorrect email$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.input_email('incorrect')
end

And(/^I input incorrect password$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.input_password('incorrect')
end

And(/^I refresh the login page$/) do
    @login_page.refresh_page
end

And(/^I click on Continue button$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.submit
end

Then(/^I should see the dashboard$/) do
    @dashboard ||= DashboardPage.new(@driver)
    @dashboard.verify_dashboard
end

Then(/^I should get red color for errors in email$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.verify_red_color_email
end

Then(/^I should get red color for errors in password$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.verify_red_color_password
end

Then(/^I should get required fields error message$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.verify_required_fields_error_message
end

Then(/^I should get incorrect email or password error message$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.verify_incorrect_email_or_password_error_message
end

When(/^I click on forgot password link$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.click_forgot_password
end

Then(/^I verify forgot password page elements$/) do
    @forgot_password_page ||= ForgotPassWordPage.new(@driver)
    @forgot_password_page.verify_forgot_password_page_elements
end

When(/^I input invalid email in forgot password$/) do
    @forgot_password_page ||= ForgotPassWordPage.new(@driver)
    @forgot_password_page.input_email('invalid')
end

And(/^I click on Continue button in forgot password$/) do
    @forgot_password_page ||= ForgotPassWordPage.new(@driver)
    @forgot_password_page.submit
end

Then(/^I should get invalid email error message$/) do
    @forgot_password_page ||= ForgotPassWordPage.new(@driver)
    @forgot_password_page.verify_invalid_email_error_message
end

When(/^I refresh the forgot password page$/) do
    @forgot_password_page ||= ForgotPassWordPage.new(@driver)
    @forgot_password_page.refresh_page
end

And(/^I input valid email in forgot password$/) do
    @forgot_password_page ||= ForgotPassWordPage.new(@driver)
    @forgot_password_page.input_email('example@abc.com')
end

Then(/^I should see email confirmation screen$/) do
    @forgot_password_page ||= ForgotPassWordPage.new(@driver)
    @forgot_password_page.verify_email_confirmation_screen
end

Then(/^I click on (facebook|google|apple) login$/) do | website |
    @login_page ||= LoginPage.new(@driver)
    if website.eql? 'facebook'
        @login_page.click_facebook_login
    elsif website.eql? 'google'
        @login_page.click_google_login
    else
        @login_page.click_apple_login
    end
end

Then(/^I verify (facebook|google|apple) login page$/) do | website |
    if website.eql? 'facebook'
        @facebook_page ||= FacebookPage.new(@driver)
        @facebook_page.verify_facebook_login_header
        @facebook_page.navigate_back
    elsif website.eql? 'google'
        @google_page ||= GooglePage.new(@driver)
        @google_page.verify_google_login_input
        @google_page.navigate_back
    else
        @apple_page ||= ApplePage.new(@driver)
        @apple_page.verify_apple_login_input
        @apple_page.navigate_back
    end
end

Then(/^I click on create account on login page$/) do
    @login_page ||= LoginPage.new(@driver)
    @login_page.click_signup_button
end

Then(/^I click on create account on signup page$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.submit
end

Then(/^I should get red color for errors in email on signup page$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.verify_red_color_email
end

Then(/^I should get required fields error message on signup page$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.verify_required_fields_error_message
end

Then(/^I verify signup page elements$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.verify_signup_page_elements
end

When(/^I refresh signup page$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.refresh_page
    @login_page ||= LoginPage.new(@driver)
    @login_page.click_signup_button
end

Then(/^I input first name in signup page$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.input_first_name('Automation')
end

Then(/^I input last name in signup page$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.input_last_name('User')
end

Then(/^I input random email in signup page$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.input_random_email
end

Then(/^I input valid password in signup page$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.input_password('TestTest@123')
end

Then(/^I input valid confirm password in signup page$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.input_confirm_password('TestTest@123')
end

Then(/^I should see fan dashboard$/) do
    @fan_dashboard_page ||= FanDashboardPage.new(@driver)
    @fan_dashboard_page.verify_fan_dashboard
end

Then(/^I input invalid password in signup page$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.input_password('Test')
end

Then(/^I input mismatching confirm password in signup page$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.input_confirm_password('Test1')
end

Then(/^I should see signup errors$/) do
    @signup_page ||= SignupPage.new(@driver)
    @signup_page.verify_signup_errors
end

Then(/^I verify empty email error in forgot password$/) do
    @forgot_password_page ||= ForgotPassWordPage.new(@driver)
    @forgot_password_page.verify_required_fields_error_message
end