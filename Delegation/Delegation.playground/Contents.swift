//: Playground - noun: a place where people can play

import UIKit

protocol CoffeeShopDelegate {
    func makeMyCoffee()
}

class Me {
    var coffeeDelegate: CoffeeShopDelegate
    
    init(coffeeShop: CoffeeShopDelegate) {
        coffeeDelegate = coffeeShop
    }
    func whenIWakeUp() {
        coffeeDelegate.makeMyCoffee()
    }
}

class Starbucks: CoffeeShopDelegate {
    
    func makeMyCoffee() {
        print("Slow Roast Coffee. Add Sugar and Cream. Over charge me. Give to Customer")
    }
}
class TimHorton: CoffeeShopDelegate {
    
    func makeMyCoffee() {
        print("Smile! Slow Roast Coffee. Add Sugar and Cream. Be super polite. Give to Customer")
    }
}
class DunkinDonuts: CoffeeShopDelegate {
    
    func makeMyCoffee() {
        print("Make small talk with customer in front of me. Slow Roast Coffee. Add Sugar and Cream. Ask if I want a donut. Give to Customer")
    }
}


 let timHorton = TimHorton()
 let dunkinDonuts = DunkinDonuts()
 
 let janeDoe = Me(coffeeShop: dunkinDonuts)
 janeDoe.whenIWakeUp()
 
 let johnDoe = Me(coffeeShop: timHorton)
 johnDoe.whenIWakeUp()

