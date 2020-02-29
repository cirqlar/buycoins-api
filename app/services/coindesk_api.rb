require 'http'
require 'json'

class CoindeskApi

  def self.calculate_price(type:,margin:,exchange_rate:)
    price = get_usd_price

    price_margin = price * ( margin / 100.0 )
    
    if (type == "sell") 
      price  -= price_margin
    elsif (type == "buy")
      price += price_margin
    else 
      return nil
    end
    
    return price * exchange_rate
  end
  
  private_class_method def self.get_usd_price
    response = HTTP.get("https://api.coindesk.com/v1/bpi/currentprice/USD.json");
    response_json = JSON.parse(response.to_s)
    return response_json['bpi']['USD']['rate_float'].to_f
  end
end