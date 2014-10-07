require 'sinatra/base'
require 'data_mapper'
require './lib/link'
require './lib/user'
require './lib/tag'
require_relative 'helpers/helpers.rb'
require_relative 'helpers/pre-runner.rb'

class BookmarkManager < Sinatra::Base

  include FunkyDamn

  set :views, Proc.new { File.join(root, "..", "app", "views")}
  enable :sessions
  set :session_secret, 'super secret'

    get '/' do
      @links = Link.all
      @users = User.all
      erb :index
    end

    post '/links' do
    	url = params["url"]
    	title = params["title"]
      tags = params["tags"].split(" ").map do |tag|
        Tag.first_or_create(:text => tag)
      end
    	Link.create(:url => url, :title => title, :tags => tags)
    	redirect to('/')
    end

    get '/tags/:text' do
      tag = Tag.first(:text => params[:text])
      @links = tag ? tag.links : []
      erb :index
    end

    get '/users/new' do
      erb :"users/new"
    end

    post '/users' do
      user = User.create(:email => params[:email],
                  :password => params[:password])
      session[:user_id] = user.id
      redirect to('/')
    end

    # start the server if ruby file executed directly
    run! if app_file == $0

end