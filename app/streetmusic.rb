require 'rubygems'
require 'sinatra'

class StreetMusicApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
end
