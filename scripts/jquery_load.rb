require 'selenium-webdriver'

@browser = Selenium::WebDriver.for :firefox
@browser.navigate.to "http://www.google.com"

jquerystring = File.open("./resources/jQuerify.js").read

@browser.manage.timeouts.script_timeout = 10

@browser.execute_async_script(jquerystring)

@browser.execute_script("jQuery(function($) { " +" $('input[name=\"q\"]').val('bada-bing').closest('form').submit(); " +" }); ");
