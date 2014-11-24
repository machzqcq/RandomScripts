
# Simulating a proxy
# 1) Download Fiddlerproxy and install it 2) Enable Rules -> Require proxy authentication in Fiddler
# 3) The default username:1 and password:1 4) After you are done with below script, ensure to remove proxy in InternetExplorer ->
# Connections -> LAN Settings -> Advanced 5) The auth url is http://1:1@127.0.0.1:8888
# http://watirmelon.com/2012/06/27/automatic-firefox-authentication-when-using-selenium-webdriver-with-autoauth/

# 1) Create a firefoxprofile and name it "seleniumprofile" (firefox.exe -p , close any existing open firefox windows)
# 2) Open firefox with that profile manually and enter the app url and if asked, save the username,password in browser
# In this case, 1 and 1 since we are using fiddler proxy
# 3) Now download the AutoAuth firefox add on - https://addons.mozilla.org/en-us/firefox/addon/autoauth/
# 4)Place it in a directory which is accessible for the script
# 5) Run the below code and you can see that it works like charm



require 'watir-webdriver'

profile = Selenium::WebDriver::Firefox::Profile.from_name 'seleniumprofile'
profile.add_extension 'autoauth-2.1-fx+fn.xpi'
b = Watir::Browser.new :firefox, :profile => profile
b.goto 'http://127.0.0.1:8888'
b.goto "http://seleniumframework.com"

b.quit
