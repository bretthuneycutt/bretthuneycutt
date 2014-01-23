require 'sinatra'

configure do
  set :views, 'views'
end

get '/' do
  haml :home
end

get '/places' do
  haml :places
end
