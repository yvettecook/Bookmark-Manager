require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require './lib/link'
require './lib/user'
require './lib/tag'
require './lib/mailer'
require 'mailgun'

require_relative 'helpers/helpers'
require_relative 'data_mapper_setup'
require_relative 'controllers/application'
require_relative 'controllers/links'
require_relative 'controllers/tag'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/forgot_password'

set :views, Proc.new { File.join(root, "..", "app", "views")}
enable :sessions
use Rack::Flash
set :session_secret, 'super secret'

set :partial_template_engine, :erb

  

    

 
    

    

