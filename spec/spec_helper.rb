require 'json_attributes'
require 'bundler/setup'

begin
  require 'pry'
rescue LoadError
end

begin
  require 'coveralls'
  Coveralls.wear!
rescue LoadError
end

load File.dirname(__FILE__) + '/support/adapters/active_record.rb'
load File.dirname(__FILE__) + '/support/data.rb'

RSpec.configure do |c|
  c.run_all_when_everything_filtered = true
end
