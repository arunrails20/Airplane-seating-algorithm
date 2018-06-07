require "bundler/setup"
require "app_constant"
require "seat_layout_generation"
require "seat_filling"
require "layout_column"
require "seat"
require "utility/integer"


RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end