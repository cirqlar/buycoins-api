module Types
  class ActionType < Types::BaseEnum
    description "All performable actions"
    
    value("buy", description: "Add computed value")
    value("sell", description: "Substract computed value")
  end
end