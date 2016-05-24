//: Playground - noun: a place where people can play

import UIKit

protocol DuckActions {
    func quack()
    func fly()
}

class RegularDuck: DuckActions {
    func quack() {
        print("Regular Duck Quack")
    }
    func fly() {
        print("Regular Duck Flying")
    }
}

protocol TurkeyActions {
    func gobble()
    func fly()
}

class RegularTurkey: TurkeyActions {
    func gobble() {
        print("Regular Turkey Gobble")
    }
    func fly() {
        print("Regular Turkey Flying a little bit")
    }
}

struct TurkeyAdapter: DuckActions {
    var turkey: RegularTurkey
    
    init(turkey: RegularTurkey){
        self.turkey = turkey
    }
    
    func quack() {
        turkey.gobble()
    }
    func fly() {
        turkey.fly()
    }
}

struct Duckish {
    var duckish: DuckActions
    
    init(duckish: DuckActions) {
        self.duckish = duckish
        duckish.quack()
        duckish.fly()
    }
}

//---------------------------------

let turkey = RegularTurkey()
let turkeyAdapter = TurkeyAdapter(turkey: turkey)
let duckish = Duckish(duckish: turkeyAdapter)
let duck = RegularDuck()
duck.quack()
duck.fly()
