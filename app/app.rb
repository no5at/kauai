require 'sinatra'
require_relative 'services/kraken_client'

get '/' do
  # TODO
  status 200
end

get '/rate/:pair' do
  @pair = params['pair'].upcase
  begin
    kraken = Kraken::Client.new()
    @price = kraken.ticker(@pair)['result'].values[0]['c'][0] # Last closed trade
    erb :rate
  rescue
    status 404
    body "Unknown pair: #{@pair}"
  end
end
