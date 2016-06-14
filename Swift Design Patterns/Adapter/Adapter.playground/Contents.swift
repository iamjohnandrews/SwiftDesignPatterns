//: Playground - noun: a place where people can play

import UIKit

protocol DuckActions {
    func quack()
    func fly()
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
// you get to call quack and fly on a turkey and it gobbles and flys