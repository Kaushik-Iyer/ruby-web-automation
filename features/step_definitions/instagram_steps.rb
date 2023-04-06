require 'selenium-webdriver'

Given("I am on the Instagram login page") do
  @driver=Selenium::WebDriver.for :chrome
  @driver.navigate.to 'https://www.instagram.com/accounts/login/'
end

When("I enter my valid credentials") do
  username=@driver.find_element(:xpath,'//*[@id="loginForm"]/div/div[1]/div/label/input')
  password=@driver.find_element(:xpath,'//*[@id="loginForm"]/div/div[2]/div/label/input')

  username.send_keys 'iyerkaushik'
  password.send_keys 'mypassword'
end

When("I enter my invalid credentials") do
  username=@driver.find_element(:xpath,'//*[@id="loginForm"]/div/div[1]/div/label/input')
  password=@driver.find_element(:xpath,'//*[@id="loginForm"]/div/div[2]/div/label/input')

  username.send_keys 'iyerkaushik'
  password.send_keys 'mypassword'
end

And("I click the login button") do
  login_button=@driver.find_element(:css,'button[type="submit"]')
  login_button.click
end

Then('I should be logged in to my account') do
  assert @driver.find_element(:css,'div[class="pbNvD"]'),"Failed to login"
  @driver.quit
end

Then("I should see an error message") do
  assert @driver.find_element(:css,'p[class="zWXXY"]'),'Failed to display error message'
  @driver.quit
end

