//: Playground - noun: a place where people can play

import UIKit

protocol Pizza {
    var name: String {get set}
    var dough: String {get set}
    var sauce: String {get set}
    var cheese: String {get set}
    var toppings: [String]? {get set}
    
    func prepare()
    func bake()
    func cut()
    func box()
}

extension Pizza {
    //we just need to rework our Pizzas so they only use factory-produced ingredients.

    func bake() {
        print("bake pizza for 20 minutes")
    }
    func cut() {
        print("cut pizza into big slices")
    }
    func box() {
        print("box pizza")
    }
}

protocol PizzaStore {
    func orderPizza(type: String) -> Pizza
    func createPizza(type: String) -> Pizza
}

extension PizzaStore {
        func orderPizza(type: String) -> Pizza {
            let pizza = createPizza(type)
    
            pizza.prepare()
            pizza.bake()
            pizza.cut()
            pizza.box()
    
            return pizza
        }
}

class NYPizzaStore: PizzaStore {
    
    func createPizza(type: String) -> Pizza {
        var pizza: Pizza
        let nyPizzaIngredientFactory = NYPizzaIngredientFactory()
        
        if type == "cheese" {
            pizza = CheesePizza(pizzaName: "New York Style Cheese Pizza",pizzaIngredientFactory: nyPizzaIngredientFactory)
        } else {
            pizza = VeggiePizza(pizzaName: "New York Style Veggie Pizza", pizzaIngredientFactory: nyPizzaIngredientFactory)
        }
        return pizza
    }
}

class CheesePizza: Pizza {
    var name: String
    var dough: String
    var sauce: String
    var cheese: String
    var toppings: [String]?
    let pizzaIngredientFactory: PizzaIngredientFactory
    
    init(pizzaName: String, pizzaIngredientFactory: PizzaIngredientFactory) {
        self.pizzaIngredientFactory = pizzaIngredientFactory
        name = pizzaName
        dough = pizzaIngredientFactory.createDough()
        sauce = pizzaIngredientFactory.createSauce()
        cheese = pizzaIngredientFactory.createCheese()
    }
    
    func prepare() {
        print("Preparing pizza \(name)")
    }
}

class VeggiePizza: Pizza {
    var name: String
    var dough: String
    var sauce: String
    var cheese: String
    var toppings: [String]?
    let pizzaIngredientFactory: PizzaIngredientFactory
    
    init(pizzaName: String, pizzaIngredientFactory: PizzaIngredientFactory) {
        self.pizzaIngredientFactory = pizzaIngredientFactory
        name = pizzaName
        dough = pizzaIngredientFactory.createDough()
        sauce = pizzaIngredientFactory.createSauce()
        cheese = pizzaIngredientFactory.createCheese()
        toppings = pizzaIngredientFactory.createVeggies()
    }
    
    func prepare() {
        print("Preparing pizza \(name)")
    }
}

/*
 Now, the main problem with the Very Dependent PizzaStore is that it depends on every type of pizza because it actually instantiates concrete types in its orderPizza() method.
 While we’ve created an abstraction, Pizza, we’re nevertheless creating concrete Pizzas in this code, so we don’t get a lot of leverage out of this abstraction.
 After applying the Factory Method, you’ll notice that our high-level component, the PizzaStore, and our low-level components, the pizzas, both depend on Pizza, the abstraction. Factory Method is not the only technique for adhering to the Dependency Inversion Principle, but it is one of the more powerful ones.
 
 Now, let’s “invert” your thinking... instead of starting at the top, start at the Pizzas and think about what you can abstract.
 */

//Ingredient Factories
protocol PizzaIngredientFactory {
    func createDough() -> String
    func createSauce() -> String
    func createCheese() -> String
    func createVeggies() -> [String]
}

class NYPizzaIngredientFactory: PizzaIngredientFactory {
    
    func createDough() -> String {
        return "Thin Crust Dough"
    }
    func createSauce() -> String {
        return "Marinara Sauce"
    }
    func createCheese() -> String {
        return "Reggiano Cheese"
    }
    func createVeggies() -> [String] {
        return ["Garlic", "Onion", "Red Pepper", "Braccoli"]
    }
}


//-------------------

let nyPizzaStore = NYPizzaStore()
let cheesePizza = nyPizzaStore.orderPizza("cheese")
let veggiePizza = nyPizzaStore.orderPizza("veggie")
