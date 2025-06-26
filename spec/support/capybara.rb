# spec/support/capybara.rb
require 'capybara/rails'
require 'capybara/rspec'
require 'selenium/webdriver'

Capybara.server = :puma, { Silent: true } # Use Puma and silence output

Capybara.register_driver :headless_chrome do |app|
  chrome_options = Selenium::WebDriver::Chrome::Options.new
  chrome_options.args << '--headless'
  chrome_options.args << '--disable-gpu'
  chrome_options.args << '--no-sandbox'
  chrome_options.args << '--window-size=1400,900'

  Capybara::Selenium::Driver.new(app,
                                 browser: :chrome,
                                 capabilities: chrome_options
  )
end

Capybara.javascript_driver = :headless_chrome
Capybara.default_max_wait_time = 5
