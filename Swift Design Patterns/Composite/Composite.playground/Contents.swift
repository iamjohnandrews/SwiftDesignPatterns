//: Playground - noun: a place where people can play

import UIKit

//NO INHERITANCE IN COMPOSITION DESIGN PATTERN 

protocol MenuComponent {
    func add(menuComponent: MenuComponent)
    func remove(menuComponentIndex: Int)
    func getChild(index: Int) -> MenuComponent
    var price: Double {get set}
    var isVegetarian: Bool {get set}
    
    var name: String {get set}
    var description: String {get set}
    func printItem()
}

extension MenuComponent {
    func add(menuComponent: MenuComponent) {
        print("WTF")
    }
    func remove(menuComponentIndex: Int) {
        print("WTF")
    }
    func getChild(index: Int) -> MenuComponent {
        return Menu(name: "defaultName", description: "defautDescription")
    }
    var isVegetarian: Bool {
        get {return false}
    }
    var price: Double {
        get {return 0.0}
    }
}


struct MenuItem: MenuComponent {
    //this is the leaf class in the Composite diagram and it implements the behavior of the elements of the composite
    
    var price: Double
    var name: String
    var description: String
    var isVegetarian: Bool
    
    
    init(name: String, description: String, isVegetarian: Bool, price: Double) {
        self.name = name
        self.description = description
        self.isVegetarian = isVegetarian
        self.price = price
    }
    
    func printItem() {
        print(" \(name) + \(description) + \(price)")
        if isVegetarian {
            print("User is a Vegetarian")
        }
    }
}

struct Menu: MenuComponent {
    var menuComponents = [MenuComponent]()
    var name: String
    var description: String
    
    init (name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    mutating func add(menuComponent: MenuComponent) {
        menuComponents.append(menuComponent)
    }
    mutating func remove(menuComponentIndex: Int) {
        menuComponents.removeAtIndex(menuComponentIndex)
    }
    func getChild(index: Int) -> MenuComponent {
        return menuComponents[index]
    }

    func printItem() {
        print("\(name) \(description)")
        
        var iterator = menuComponents.generate()
        while let menuComponent = iterator.next() {
            menuComponent.printItem()
        }
        //http://nshipster.com/swift-collection-protocols/
    }
}

struct Waitress {
    var allMenus: [MenuComponent]
    
    init(menuComponents: [MenuComponent]) {
        self.allMenus = menuComponents
    }
    
    func printMenu() {
        for element in allMenus {
            element.printItem()
        }
    }
}

//-------------------------------

let pancakeMenu = Menu(name: "PANCAKE MENU", description: "Breakfast")
let dinnerMenu = Menu(name:"DINER MENU", description:"Dinner")
let cafeMenu = Menu(name:"CAFE MENU", description:"Dinner")
let dessertMenu = Menu(name:"DESSERT MENU", description:"Dessert")
 
let allMenus = [pancakeMenu as MenuComponent, dinnerMenu as MenuComponent, cafeMenu as MenuComponent, dessertMenu as MenuComponent]

let pasta = MenuItem(name: "Pasta", description: "Spaghetti with Marinara Sauce", isVegetarian: true, price: 6.89)
dinnerMenu.add(pasta)
 
let applePie = MenuItem(name: "Apple Pie", description: "warm apple Pie with vanilla ice cream", isVegetarian: true, price: 5.25)
dessertMenu.add(applePie)
 
let waitress = Waitress(menuComponents: allMenus)
waitress.printMenu()


