require 'selenium-webdriver'


@browser = Selenium::WebDriver.for :chrome

@browser.navigate.to 'http://adam.goucher.ca/parkcalc/'

@browser.find_element(:xpath => "//img[@alt='Pick a date']").click

window_handles =  @browser.window_handles.length

@browser.window_handles.map do |window|
  p window
end

@browser.switch_to.window(@browser.window_handles.last)

@browser.find_element(:link => '4').click

# @browser.execute_script("winMain.document.getElementById('EntryDate').value='10/4/2014';;window.close();'")

sleep 5

@browser.quit

