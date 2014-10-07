require 'sinatra/base'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'

	DataMapper.finalize
	DataMapper.auto_upgrade! 

class BookmarkManager < Sinatra::Base

set :views, Proc.new { File.join(root, "..", "views")}

  get '/' do
    @links = Link.all
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

  # start the server if ruby file executed directly
  run! if app_file == $0
end