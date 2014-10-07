
# http://watirwebdriver.com/javascript-dialogs/
require 'watir-webdriver'


@browser = Watir::Browser.new :chrome
@browser.goto 'http://demo.guru99.com/V4'

@browser.text_field(:name => 'uid').send_keys('sdfds')
@browser.text_field(:name => 'password').send_keys('asdfd')
@browser.button(:name => 'btnLogin').click

if(@browser.alert.exists?)
  @browser.alert.ok
end

sleep 5

@browser.quit




