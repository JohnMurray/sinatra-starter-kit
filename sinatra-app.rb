require 'sinatra'
require './config/sinatra-config.rb'


get '/' do
  send_file(File.join(settings.public, 'index.html'))
end

get '/hello/haml' do
  haml :hello
end
