require 'sinatra'
require_relative 'services/kraken_client'

get '/' do
  'Hello World'
end

get '/ticker/:pair' do
  pair = params['pair']
  kraken = Kraken::Client.new()
  @price = kraken.ticker(pair)['result'].values[0]['c'][0] # Last closed trade
  erb :ticker
end
