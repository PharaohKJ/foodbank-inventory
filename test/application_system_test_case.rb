require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  browser = ENV.fetch("HEADLESS", "true") == "false" ? :chrome : :headless_chrome
  driven_by :selenium, using: browser, screen_size: [1400, 1400]
end
