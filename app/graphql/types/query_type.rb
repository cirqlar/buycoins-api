require 'coindesk_api'
module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :calculate_price, Float, null: false do
      argument :type, Types::ActionType, required: true
      argument :margin, Float, required: true
      argument :exchange_rate, Float, required: true
    end

    def calculate_price(type:,margin:,exchange_rate:)
      return CoindeskAPI.calculate_price(type: type, margin: margin, exchange_rate: exchange_rate)
    end

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end