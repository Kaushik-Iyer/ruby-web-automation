require 'selenium-webdriver'
require 'test/unit/assertions'
include Test::Unit::Assertions
JENKINS_URL = 'http://localhost:8080'

Given('I am on the Jenkins login page') do
  @driver = Selenium::WebDriver.for :chrome
  @driver.navigate.to "#{JENKINS_URL}/login"
end

When('I enter my username and password') do
  username_input = @driver.find_element(name: 'j_username')
  password_input = @driver.find_element(name: 'j_password')

  username_input.send_keys 'kaushik'
  password_input.send_keys 'kaushiksjenkins'
end

When('I click the {string} button') do |button_text|
  login_button = @driver.find_element(name: 'Submit')
  login_button.click
end

When('I create a new freestyle project') do
  new_item_link = @driver.find_element(link_text: 'New Item')
  new_item_link.click
  project_name_input = @driver.find_element(name: 'name')
  project_type_radio = @driver.find_element(xpath: '//*[@id="j-add-item-type-standalone-projects"]/ul/li[1]')
  ok_button = @driver.find_element(id: 'ok-button')
  sleep(2)
  project_name_input.send_keys 'My Freestyle Project'
  project_type_radio.click
  ok_button.click
end

Then('I should see the new project on the dashboard') do
  @driver.get 'http://localhost:8080/'
  new_project_link = @driver.find_element(link_text: 'My Freestyle Project')
  assert_not_nil new_project_link
  sleep(3)
  @driver.quit
end