#---
# Excerpted from "Rails 5 Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/nrtest3 for more book information.
#---
require "capybara-screenshot/rspec"

Capybara.register_driver(:headless_chrome) do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {args: %w[headless disable-gpu]}
  )

  Capybara::Selenium::Driver.new(
    app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.javascript_driver = :headless_chrome
