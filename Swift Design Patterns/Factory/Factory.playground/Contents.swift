//: Playground - noun: a place where people can play

import UIKit

protocol PizzaStoreFactoryProtocol {
    func orderPizza()
    func createPizza()
    
}

protocol PizzaIngrediantFactory {
    func createDough() -> String
    func createSauce() -> String
    func createCheese() -> String
    
}

protocol PizzaProtocol {
    var name: String {get set}
    var dough: String {get set}
    var sauce: String {get set}
    var toppings: [String] {get set}
    
    func prepare()
    func bake()
    func cut()
    func box()
}

struct NYCPizzaStore: PizzaStoreFactoryProtocol, PizzaProtocol {
    
    var name: String
    var dough: String
    var sauce: String
    var toppings: [String]

    init(pizzaName: String, doughType: String, sauceType: String, toppingsType: [String]) {
        name = pizzaName
        dough = doughType
        sauce = sauceType
        toppings = toppingsType
    }
    
    func prepare() {
        print("preparing a \(name) pizza")
        print("tossing the dough")
        print("adding sauce")
        print("adding toppings")
    }
}

struct NYCPizzaIngrediantFactory: PizzaIngrediantFactory {
    func createDough() -> String {
        return "Thin Crust Dough"
    }
    
    func createCheese() -> String {
        return "Mozzarella Cheese"
    }
    
    func createSauce() -> String {
        return "Marinara Sause"
    }
}

struct CheesePizza: PizzaProtocol {
    var ingrediantFactory: PizzaIngrediantFactory
    var name: String
    var dough: String
    var sauce: String
    var toppings: [String]

    init(chosenPizzaIngrediantFactory: PizzaIngrediantFactory) {
        ingrediantFactory = chosenPizzaIngrediantFactory
    }
    
    mutating func prepare() {
        dough = ingrediantFactory.createDough()
        sauce = ingrediantFactory.createSauce()
        
        print("preparing a \(name) pizza")
        print("tossing the dough")
        print("adding sauce")
        print("adding toppings")
    }
    
}


// go back through Safari online and use inheritance first, then refactor to protocols if u see fit
