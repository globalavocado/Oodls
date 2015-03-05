require 'data_mapper'
require_relative './models/user.rb'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/oodls_#{env}")

DataMapper.auto_upgrade!

DataMapper.finalize
