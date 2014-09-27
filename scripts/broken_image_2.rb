# filename: broken_image_2.rb
# http://elementalselenium.com/tips/67-broken-images

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  @driver = Selenium::WebDriver.for :firefox
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  require 'rest-client'

  @driver.get 'http://the-internet.herokuapp.com/broken_images'

  all_images = @driver.find_elements(tag_name: 'img')

  all_images.each do |img|
    RestClient.get img.attribute('src') do |response, request, result|
      expect(response.code).to eq 200
    end
  end

end