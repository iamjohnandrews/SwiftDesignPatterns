//: Playground - noun: a place where people can play

import UIKit

//class PizzaStore {
//
//    func orderPizza(type: String) -> Pizza {
//        let pizza = createPizza(type)
//
//        pizza.prepare()
//        pizza.bake()
//        pizza.cut()
//        pizza.box()
//
//        return pizza
//    }
//
//    func createPizza(type: String) -> Pizza {
//        return Pizza()
//    }
//}

//public class Pizza {
//    var name: String = "decided by subclass instntiation"
//    var dough: String = "decided by subclass instntiation"
//    var sauce: String = "decided by subclass instntiation"
//    var toppings: [String] = ["decided by subclass instntiation"]
//
//    func prepare() {
//        print("Preparring \(name)")
//        print("Tossing \(dough)")
//        print("Adding \(sauce)")
//        for topping in toppings {
//            print("add \(topping) toppings")
//        }
//    }
//    func bake() {
//        print("bake pizza for 20 minutes")
//    }
//    func cut() {
//        print("cut pizza into big slices")
//    }
//    func box() {
//        print("box pizza")
//    }
//}

protocol Pizza {
    var name: String {get set}
    var dough: String {get set}
    var sauce: String {get set}
    var toppings: [String] {get set}
    
    func prepare()
    func bake()
    func cut()
    func box()
}

extension Pizza {
    func prepare() {
        print("Preparring \(name)")
        print("Tossing \(dough)")
        print("Adding \(sauce)")
        for topping in toppings {
            print("add \(topping) toppings")
        }
    }
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
        var nyPizza: Pizza
        
        if type == "cheese" {
            nyPizza = NYStyleCheesePizza()
        } else {
            nyPizza = BasicPizza()
        }
        
        return nyPizza
    }
}

class BasicPizza: Pizza {
    var name = "Basic Pizza"
    var dough = "Cardboard crust"
    var sauce = "Red Sauce"
    var toppings = ["Cheese", "Pepperroni"]
}

class NYStyleCheesePizza: Pizza {
    var name = "NY Style Pizza"
    var dough = "Floppy, thin crust"
    var sauce = "Marinara Sauce"
    var toppings = ["Pepper Jack Cheese", "Mozzarella Cheese"]
}

let nyPizzaStore = NYPizzaStore()
let pizza = nyPizzaStore.orderPizza("cheese")
print("I ordered a \(pizza.name) pizza")
