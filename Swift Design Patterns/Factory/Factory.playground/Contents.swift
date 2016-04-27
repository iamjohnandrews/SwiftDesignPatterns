//: Playground - noun: a place where people can play

import UIKit

protocol PizzaStoreFactoryProtocol {
    func orderPizza()
    func createPizza()
    
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

struct NYCPizzaStore: PizzaStoreFactoryProtocol {
    <#properties and methods#>
}

struct ChicagoPizzaStore: PizzaStoreFactoryProtocol {
    <#properties and methods#>
}