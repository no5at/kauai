ENV['RACK_ENV'] = 'test'

require '../app/app.rb'
require 'test/unit'
require 'rack/test'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_api_connectivity
    # Just test if no exception happens
    kraken = Kraken::Client.new()
    time = kraken.server_time
  end

end
