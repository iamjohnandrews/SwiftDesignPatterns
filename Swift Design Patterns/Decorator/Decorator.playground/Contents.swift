//: Playground - noun: a place where people can play

import UIKit


protocol BeverageDecorator {
    func drinkDescription() -> String
    func getDrinkCost() -> Double
}


class Beverage: BeverageDecorator { //treat this like abstract class
    var description = "TBD by Subclass"
    var cost: Double = 0.0
    
    func drinkDescription() -> String {
        return description
    }
    func getDrinkCost() -> Double {
        return cost
    }
}

// Drinks
class HouseBlend: Beverage {
    override init() {
        super.init()
        description = "House Blend Coffee"
        cost = 1.89
    }
    
    override func drinkDescription() -> String {
        return description
    }
    
    override func getDrinkCost() -> Double {
        return cost
    }
}

class Expresso: Beverage {
    override init() {
        super.init()
        description = "Expresso"
        cost = 3.09
    }
    
    override func drinkDescription() -> String {
        return description
    }
    
    override func getDrinkCost() -> Double {
        return cost
    }
}


// Condiment Wrappers
class Hazelnut: Beverage {
    var beverage: Beverage
    
    init(chosenDrink: Beverage ) {
        beverage = chosenDrink
    }
    
    override func drinkDescription() -> String {
        return beverage.drinkDescription() + " + Hazelnut"
    }
    
    override func getDrinkCost() -> Double {
        return beverage.getDrinkCost() + 0.42
    }
}

class Caramel: Beverage {
    var beverage: Beverage
    
    init(chosenDrink: Beverage ) {
        beverage = chosenDrink
    }
    
    override func drinkDescription() -> String {
        return beverage.drinkDescription() + " + Caramel"
    }
    
    override func getDrinkCost() -> Double {
        return beverage.getDrinkCost() + 0.27
    }
}

class WhipCream: Beverage {
    var beverage: Beverage
    
    init(chosenDrink: Beverage ) {
        beverage = chosenDrink
    }
    
    override func drinkDescription() -> String {
        return beverage.drinkDescription() + " + Whip Cream"
    }
    
    override func getDrinkCost() -> Double {
        return beverage.getDrinkCost() + 0.43
    }
}

let houseBlendCoffee = HouseBlend()
houseBlendCoffee.getDrinkCost()
houseBlendCoffee.drinkDescription()

let hazelnutCoffee = Hazelnut(chosenDrink: houseBlendCoffee)
hazelnutCoffee.getDrinkCost()
hazelnutCoffee.drinkDescription()

let hazelnutCaramelCoffee = Caramel(chosenDrink: hazelnutCoffee)
hazelnutCaramelCoffee.getDrinkCost()
hazelnutCaramelCoffee.drinkDescription()

let expresso = Expresso()
let caramelHazelNutWhipCreamExpresso = WhipCream(chosenDrink: Caramel (chosenDrink: Hazelnut(chosenDrink: expresso)))
caramelHazelNutWhipCreamExpresso.getDrinkCost()
caramelHazelNutWhipCreamExpresso.drinkDescription()
