require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::Console]
)
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    system('rubocop .')
    system('flog -ga ./lib/*')
  end
end
