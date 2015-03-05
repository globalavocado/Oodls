require 'sinatra'
require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'controllers/application.rb'
require_relative 'controllers/about_oodls.rb'
require_relative 'controllers/user.rb'
require_relative 'controllers/sign_in.rb'
require_relative 'data_mapper_setup'
require_relative 'helpers/helper.rb'

class Oodls < Sinatra::Base

	enable :sessions
	set :session_secret, 'super secret'
	register Sinatra::Flash

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "/views") }

  run! if app_file == $0
end

