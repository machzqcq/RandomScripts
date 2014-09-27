gem 'saucelabs'
require 'saucelabs'

@browser = SauceLabs.selenium_driver(browser = :'chrome|xp', browser_options = {:url => 'http://localhost:4444/wd/hub'})

@browser.navigate.to "http://www.google.com"