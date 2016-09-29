import UIKit

protocol FlyBehavior {
    func fly() -> String
}

struct ItFlys: FlyBehavior {
    func fly() -> String {
        return "can fly"
    }
}

struct ItCannotFly: FlyBehavior {
    func fly() -> String {
        return "cannot fly"
    }
}

class Animal {
    var flyThing: FlyBehavior?
    
    // Instead of using an interface in a traditional way
    // we use an instance variable that is a subclass
    // of the Flys interface.
    
    // Animal doesn't care what flyingType does, it just
    // knows the behavior is available to its subclasses
    
    // This is known as Composition : Instead of inheriting
    // an ability through inheritance the class is composed
    // with Objects with the right ability
    
    // Composition allows you to change the capabilities of
    // objects at run time!
    
    func tryToFly() -> String? {
        guard let canAnimalFly = flyThing else {return nil}
        return canAnimalFly.fly()
    }
}

class Chipmunk: Animal {
    override init() {
        super.init()
        flyThing = ItCannotFly()
    }
}

class Pigeon: Animal {
    override init() {
        super.init()
        flyThing = ItFlys()
    }
}

let alvin = Chipmunk()
let paula = Pigeon()

print("Chipmunk \(alvin.tryToFly()!)")
print("Pigeon \(paula.tryToFly()!)")

alvin.flyThing = ItFlys()
print("Chipmunk \(alvin.tryToFly()!)")
