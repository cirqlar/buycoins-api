# BuyCoins API

An API built for a buycoins challenge.

It is a GraphQL API with one query: `calculatePrice`

Required Parameters:

* type: Either "buy" or "sell" (without quotes). Dictates whether the margin is added or subtracted from the price.
* margin: Float representing the percentage margin
* exchange_rate: Float representing the NGN/USD exchange rate (i.e 1 USD in NGN)

Example request and response:
```
query {
  calculatePrice(type: buy, margin: 1.20, exchangeRate: 100) 
}

Response:
{
  "data": {
    "calculatePrice": 875381.85196
  }
}
```

[Click Here](https://buycoins-cirqlar.herokuapp.com/graphiql) to visit the GraphiQL interface.