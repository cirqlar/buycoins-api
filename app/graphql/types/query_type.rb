module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :calculate_price, Float, null: false do
      argument :type, Types::PriceType, required: true
      argument :margin, Float, required: true
      argument :exchange_rate, Float, required: true
    end

    def calculate_price(type:,margin:,exchange_rate:)
      puts type
      puts margin
      puts exchange_rate
      200.19
    end

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
