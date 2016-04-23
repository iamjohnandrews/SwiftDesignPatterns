//: Playground - noun: a place where people can play

import UIKit


// Usually Beverage would be an abstract class but Swift programming language doesn't support abstract classes

protocol BeverageDecorator {
//    var description: String {get set}
//    var cost: float_t {get set}
    
    func drinkDescription() -> String
    
    func getDrinkCost() -> float_t
}

//extension BeverageDecorator  {
//    var description: String {return "TBD by subclass"}
//    var cost: float_t {return 1.79}
//}
//How could I implement Decorator with just extenstion as default

class Beverage: BeverageDecorator {
    
    func getDrinkCost() -> float_t {
        return 1.74 //this is just black coffee
    }
    
    func drinkDescription() -> String {
        return "TBD by subclass"
    }
}

class Hazelnut: Beverage {
    var beverage: Beverage
    
    init(chosenDrink: Beverage ) {
        beverage = chosenDrink
        super.init()
    }
    
    override func drinkDescription() -> String {
        return beverage.drinkDescription() + "Hazelnut"
    }
    
    override func getDrinkCost() -> float_t {
        return beverage.getDrinkCost() + 0.42
    }
}

class Caramel: Beverage {
    var beverage: Beverage
    
    init(chosenDrink: Beverage ) {
        beverage = chosenDrink
        super.init()
    }
    
    override func drinkDescription() -> String {
        return beverage.drinkDescription() + "Caramel"
    }
    
    override func getDrinkCost() -> float_t {
        return beverage.getDrinkCost() + 0.29
    }
}

var coffee = Beverage()
coffee.getDrinkCost()

var hazelnutCoffee = Hazelnut(chosenDrink: coffee)
hazelnutCoffee.getDrinkCost()

var hazelnutCaramelCoffee = Caramel(chosenDrink: hazelnutCoffee)
hazelnutCaramelCoffee.getDrinkCost()


