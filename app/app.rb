require 'sinatra'
require_relative 'services/kraken_service'

get '/' do
  Kraken::getAssets()
end
