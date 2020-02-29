require 'test_helper'
require 'http'
require 'exceptions'

class CoindeskApiTest < ActiveSupport::TestCase
  test "#calculate_price sells" do

    HTTP.stub :get, "{\"bpi\":{\"USD\":{\"rate_float\":1000}}}" do
      price1 = CoindeskApi.calculate_price(type: 'sell', margin: 0.2, exchange_rate: 20)
      
      price2 = CoindeskApi.calculate_price(type: 'sell', margin: 20, exchange_rate: 365.34)
      

      assert_equal 19960.0, price1
      assert_equal 292272.0, price2
    end
  end

  test "#calculate_price buys" do

    HTTP.stub :get, "{\"bpi\":{\"USD\":{\"rate_float\":1000}}}" do
      price1 = CoindeskApi.calculate_price(type: 'buy', margin: 0.2, exchange_rate: 20)
      
      price2 = CoindeskApi.calculate_price(type: 'buy', margin: 20, exchange_rate: 365.34)
      

      assert_equal 20040.0, price1
      assert_equal 438407.99999999994, price2
    end
  end

  test "#calculate_price throws error on invalid arguments" do
    HTTP.stub :get, "{\"bpi\":{\"USD\":{\"rate_float\":1000}}}" do
      assert_raises Exceptions::InvalidArgument  do
        CoindeskApi.calculate_price(type: "letterbox", margin: 0.2, exchange_rate: 20)
      end
    end
  end

  test "#calculate_price throws error on bad http request" do
    HTTP.stub :get, "some random data" do
      assert_raises Exceptions::InternalServerError  do
        CoindeskApi.calculate_price(type: "letterbox", margin: 0.2, exchange_rate: 20)
      end
    end
  end
end