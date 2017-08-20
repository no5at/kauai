require 'sinatra'

require_relative 'services/kraken_client'
require_relative 'query_job'

# ActiveRecord::Base.establish_connection(
#   :adapter  => "sqlite3",
#   :database => "kauai.db"
#)

class Application < Sinatra::Base

  Thread.new do # trivial example work thread
    kraken = Kraken::Client.new()
    while true do
      begin
        price = kraken.ticker('XBTEUR,BCHEUR')
        puts price
      rescue
        puts 'Error fetching current rates'
      end
      sleep 5
    end
  end

  get '/' do
    # TODO
    status 200
  end

  get '/rate/:pair' do
    @pair = params['pair'].upcase
    begin
      @price = kraken.ticker(@pair)['result'].values[0]['c'][0] # Last closed trade
      erb :rate
    rescue
      status 404
      body "Unknown pair: #{@pair}"
    end
  end
end
