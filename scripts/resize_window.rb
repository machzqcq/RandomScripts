require 'selenium-webdriver'
require 'watir-webdriver'
# The below code doesn't go well with IE

browser = ENV['BROWSER'].nil? ? "chrome" : ENV['BROWSER']

driver = Selenium::WebDriver.for browser.to_sym
 if driver.browser == :firefox or :chrome
    driver.execute_script("window.open(#{driver.current_url.to_json},'_blank');")
    driver.close
    driver.switch_to.window driver.window_handles.first
  end
  driver.execute_script("window.innerWidth = 1024; window.innerHeight = 768;")
  @browser = Watir::Browser.new driver
