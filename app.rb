require 'rubygems'
require 'bundler'
require 'sinatra'
require 'yaml'

ENV['RACK_ENV'] ||= 'development'
ENV['MAPS_API_KEY'] ||= 'AIzaSyBuVzKxLXD2UehCt1qfFsTItGe2gHFQvT0'

Bundler.require :default, ENV['RACK_ENV'].to_sym

Dir[File.join(File.dirname(__FILE__), 'lib','*.rb')].each do |f|
  require f
end

helpers Sinatra::ContentFor

configure do
  set :views, 'views'
end

get '/' do
  haml :home
end

get '/places' do
  @places = YAML.load_file("./data/places.yml").map { |a| Place.new(a) }
  haml :places
end
