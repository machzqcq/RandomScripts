require 'selenium-webdriver'


def alert_present?
  begin
    @alert= @browser.switch_to.alert
    puts "Alert present!"
    return true
  rescue
    puts "No alert present."
    return false
  end
end


@browser = Selenium::WebDriver.for :chrome
@browser.navigate.to 'http://demo.guru99.com/V4'

@browser.find_element(:name => 'uid').send_keys('sdfds')
@browser.find_element(:name => 'password').send_keys('asdfd')
@browser.find_element(:name => 'btnLogin').click

# The below line will gracefully accept the pop up if present. This doesn't give us confidence for handling forgot password pop up though
# @browser.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError

if (alert_present?)
  @alert.accept
  puts "continue with execution"
end

sleep 5

@browser.quit




