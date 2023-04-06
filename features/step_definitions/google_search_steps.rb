require 'selenium-webdriver'
require 'rspec'

Given('I am on the Google homepage') do
  @driver=Selenium::WebDriver.for :chrome
  @driver.navigate.to 'https://www.google.com'
end

When('I search for {string}') do |string|
  search_box=@driver.find_element(name:'q')
  search_box.send_keys string
  search_box.submit
end

Then('I should see search results') do
  wait=Selenium::WebDriver::Wait.new(timeout:10)
  wait.until{@driver.find_element(css: '#search')}
  expect(@driver.title).to include('ruby automation')
  @driver.quit
end