require 'rubygems'
require 'bundler'
require 'sinatra'
require 'yaml'

ENV['RACK_ENV'] ||= 'development'
ENV['MAPS_API_KEY'] ||= 'AIzaSyBuVzKxLXD2UehCt1qfFsTItGe2gHFQvT0'

Bundler.require :default, ENV['RACK_ENV'].to_sym

helpers Sinatra::ContentFor

configure do
  set :views, 'views'
end

get '/' do
  haml :home
end

get '/places' do
  @places = YAML.load_file("./data/places.yml")
  haml :places
end
