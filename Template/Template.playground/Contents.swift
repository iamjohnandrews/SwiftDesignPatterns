//: Playground - noun: a place where people can play

import UIKit

protocol CaffeineBeverage {
    func prepareRecipe()
    func boilWater()
    func brew()
    func pourInCup()
    func addCondiments()
    func doesCustomerWantCondiments() -> Bool
}

extension CaffeineBeverage {
    func prepareRecipe() {
        self.boilWater()
        self.brew()
        self.pourInCup()
        if doesCustomerWantCondiments() {
            self.addCondiments()
        }
    }
    
    func boilWater() {
        print("Boiling water")
    }
    func pourInCup() {
        print("Pouring into cup")
    }
    func doesCustomerWantCondiments() -> Bool {
        return true
    }
}

struct Tea: CaffeineBeverage {
    var wantsHoney: Bool
    
    init(wantsHoney: Bool) {
        self.wantsHoney = wantsHoney
    }
    func brew() {
        print("Steeping the tea")
    }
    func addCondiments() {
        print("Add Honey")
    }

    func doesCustomerWantCondiments() -> Bool {
        return wantsHoney
    }
}

struct Coffee: CaffeineBeverage {
    func brew() {
        print("Dripping coffee through filter")
    }
    func addCondiments() {
        print("Adding sugar and milk")
    }
}

let myTea = Tea(wantsHoney: true)
myTea.prepareRecipe()

//let myCoffee = Coffee()
//myCoffee.prepareRecipe()
