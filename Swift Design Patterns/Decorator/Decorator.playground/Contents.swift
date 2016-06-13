//: Playground - noun: a place where people can play

import UIKit


protocol BeverageDecorator {
    func drinkDescription() -> String
    func getDrinkCost() -> Double
}

/*
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

//Condiment Wrapper
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
*/

protocol Beverage: BeverageDecorator {
    var cost: Double {get set}
    var description: String {get set}
}

extension Beverage {
    func drinkDescription() -> String {
        return description
    }
    func getDrinkCost() -> Double {
        return cost
    }
}

class HouseBlend: Beverage {
    var description: String = "House Blend Coffee"
    var cost: Double = 1.89
    
    func drinkDescription() -> String {
        return description
    }
    
    func getDrinkCost() -> Double {
        return cost
    }
}

class Expresso: Beverage {
    var description: String = "Expresso"
    var cost: Double = 3.09
    
    func drinkDescription() -> String {
        return description
    }
    
    func getDrinkCost() -> Double {
        return cost
    }
}


// Condiment Wrappers
struct Hazelnut: Beverage {
    
    var beverage: Beverage
    var description: String
    var cost: Double
    
    init(chosenDrink: Beverage ) {
        beverage = chosenDrink
        description = beverage.drinkDescription() + " + Hazelnut"
        cost = beverage.getDrinkCost() + 0.42
    }
}

struct Caramel: Beverage {
    
    var beverage: Beverage
    var description: String
    var cost: Double
    
    init(chosenDrink: Beverage ) {
        beverage = chosenDrink
        description = beverage.drinkDescription() + " + Caramel"
        cost = beverage.getDrinkCost() + 0.27
    }
}

struct WhipCream: Beverage {
    
    var beverage: Beverage
    var description: String
    var cost: Double
    
    init(chosenDrink: Beverage ) {
        beverage = chosenDrink
        description = beverage.drinkDescription() + " + Whip Cream"
        cost = beverage.getDrinkCost() + 0.43
    }
}

let houseBlendCoffee = HouseBlend()
houseBlendCoffee.getDrinkCost()
houseBlendCoffee.drinkDescription()

let hazelnutCoffee = Hazelnut(chosenDrink: houseBlendCoffee)
hazelnutCoffee.cost
hazelnutCoffee.description

let hazelnutCaramelCoffee = Caramel(chosenDrink: hazelnutCoffee)
hazelnutCaramelCoffee.cost
hazelnutCaramelCoffee.description

let expresso = Expresso()
let caramelHazelNutWhipCreamExpresso = WhipCream(chosenDrink: Caramel (chosenDrink: Hazelnut(chosenDrink: expresso)))
caramelHazelNutWhipCreamExpresso.getDrinkCost()
caramelHazelNutWhipCreamExpresso.drinkDescription()
caramelHazelNutWhipCreamExpresso.cost
caramelHazelNutWhipCreamExpresso.description
