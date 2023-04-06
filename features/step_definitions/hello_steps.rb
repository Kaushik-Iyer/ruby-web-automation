require 'selenium-webdriver'
require 'rspec'
driver=Selenium::WebDriver.for :chrome

Given('I am on the lazy automation test page') do
  driver.navigate.to 'http://lazyautomation.co.uk/lazy1.html'
end

When("I click Hello World") do
  driver.find_element(:id,'hello1').click
end

Then("Hello World text is displayed") do
  label_text=driver.find_element(:id,'test').text
  expect(label_text).to eq('HELLO WORLD')
end