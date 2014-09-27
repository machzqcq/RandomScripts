# filename: broken_image_1.rb
# http://elementalselenium.com/tips/67-broken-images

require 'browsermob/proxy'
require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def configure_proxy
  server = BrowserMob::Proxy::Server.new('./browsermob-proxy-2.0-beta-9/bin/browsermob-proxy')
  server.start
  @proxy = server.create_proxy
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.proxy = @proxy.selenium_proxy
  return profile
end

def setup
  @driver = Selenium::WebDriver.for :firefox, profile: configure_proxy
end

def teardown
  @driver.quit
  @proxy.close
end

def run
  setup
  yield
  teardown
end

run do
  @proxy.new_har

  @driver.get 'http://the-internet.herokuapp.com/broken_images'

  all_images = @driver.find_elements(tag_name: 'img')

  broken_images = []
  all_images.each do |img|
    broken_images << @proxy.har.entries.find do |entry|
      entry.request.url == img.attribute('src') && entry.response.status == 404
    end
  end

  expect(broken_images).to be_empty
end