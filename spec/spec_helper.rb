require 'rubygems'
require 'rspec'
require File.dirname(__FILE__) + '/../lib/toy_robot_simulator'
require "factories"

RSpec.configure do |config|

  config.include Factories

end
