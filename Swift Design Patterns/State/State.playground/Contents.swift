//: Playground - noun: a place where people can play

import UIKit

// Solution A: wrong implementation
enum QuarterState: Int {
    case SoldOut
    case NoQuarter
    case HasQuarter
    case Sold
}
/*
class GumBallMachineA {
    var quarterState: QuarterState = .SoldOut
    var gumballCount: Int
    
    init(count: Int) {
        self.gumballCount = count
        if count > 0 {
            quarterState = .NoQuarter
        }
    }
    
    func insertQuarter() {
        switch quarterState {
        case .HasQuarter:
            print("You can't insert another quarter")
        case .NoQuarter:
            quarterState = .HasQuarter
            print("You inserted a quarter")
        case .SoldOut:
            print("You can't insert a quarter. Machine is sold out")
        case .Sold:
            print("Please wait, we're already giving you a gumball")
        }
    }
    
    func ejectQuarter() {
        switch quarterState {
        case .HasQuarter:
            quarterState = .NoQuarter
            print("Quarter returned")
        case .NoQuarter:
            print("You have NOT inserted a quarter")
        case .SoldOut:
            print("You cannot eject. You haven't inserted a quarter")
        case .Sold:
            print("You already turned the crank")
        }
    }
    
    func turnCrank() {
        switch quarterState {
        case .HasQuarter:
            print("You turned...")
            quarterState = .Sold
            dispense()
        case .NoQuarter:
            quarterState = .HasQuarter
            print("You turned but there is no quarter")
        case .SoldOut:
            print("You turned but we are out of gumballs")
        case .Sold:
            print("Turning twice does not get you another gumball!")
        }
    }
    
    func dispense() {
        switch quarterState {
        case .HasQuarter:
            print("No gumball dispensed")
        case .NoQuarter:
            print("You need to pay first")
        case .SoldOut:
            print("No gumball dispensed")
        case .Sold:
            print("gumball rolls out of slot")
            gumballCount = gumballCount - 1
            if gumballCount == 0 {
                print("Oops, we're out of gumballs")
                quarterState = .SoldOut
            } else {
                quarterState = .NoQuarter
            }
        }
    }
}
//----------------

let gumballMachine = GumBallMachineA(count: 5)
gumballMachine.insertQuarter()
gumballMachine.turnCrank()
*/
//----------------

protocol State {
    func insertQuarter()
    func ejectQuarter()
    func turnCrank()
    func dispense()
}

extension State { //in video, make extension when you implement WinnerState class
    func insertQuarter() {
        print("Please wait, we're already giving you a gumball")
    }
    func ejectQuarter() {
        print("Sorry, you already turned the crank")
    }
    func turnCrank() {
        print("Turning twice doesn't get you another gumball")
    }
}

struct SoldState: State {
    var gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    func dispense() {
        gumballMachine.releaseGumball()
        if gumballMachine.gumballCounter > 0 {
            gumballMachine.setState(gumballMachine.noQuarterState!)
        } else {
            print("Oops, we're out of gumballs")
            gumballMachine.setState(gumballMachine.soldOutState!)
        }
    }
}

//page "State Pattern Defined" all of it + Q&A

struct SoldOutState: State {
    var gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    func insertQuarter() {
        print("Oops, we're out of gumballs")
    }
    func ejectQuarter() {

    }
    func turnCrank() {
        print("Oops, we're out of gumballs")
    }
    func dispense() {
        print("Oops, we're out of gumballs")
    }
}
struct HasQuarterState: State {
    var gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    func insertQuarter() {
        print("You cannot insert another quarter")
    }
    func ejectQuarter() {
        print("Quarter returned")
        gumballMachine.setState(gumballMachine.noQuarterState!)
    }
    func turnCrank() {
        print("You turned crank...")
        gumballMachine.setState(gumballMachine.soldState!)
    }
    func dispense() {
        print("No gumball dispensed")
    }
}
struct NoQuarterState: State {
    var gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    func insertQuarter() {
        gumballMachine.setState(gumballMachine.hasQuarterState!)
    }
    func ejectQuarter() {
        print("You have not inserted a quarter")
    }
    func turnCrank() {
        print("You turned crank, but there is no quarter")
    }
    func dispense() {
        print("You need to pay. Gumballs cost 25 cents")
    }
}
struct WinnerState: State {
    var gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    func dispense() {
        gumballMachine.releaseGumball()
        if gumballMachine.gumballCounter == 0 {
            gumballMachine.setState(gumballMachine.noQuarterState!)
        } else {
            gumballMachine.releaseGumball()
            print("You're a Winner! You get an extra gumball for free")
            
            if gumballMachine.gumballCounter > 0 {
                gumballMachine.setState(gumballMachine.noQuarterState!)
            } else {
                print("Oops, we're out of gumballs")
                gumballMachine.setState(gumballMachine.soldOutState!)
            }
        }
    }
}

class GumballMachine {
    var soldOutState: State?
    var noQuarterState: State?
    var hasQuarterState: State?
    var soldState: State?
    //States have to be optionals because cannot use self before all stored properties are initialized
    var gumballCounter: Int = 0
    var state: State?
    
    init(gumballCount: Int) {
        soldOutState = SoldOutState(gumballMachine: self)
        noQuarterState = NoQuarterState(gumballMachine: self)
        hasQuarterState = HasQuarterState(gumballMachine: self)
        soldState = SoldState(gumballMachine: self)
        
        self.gumballCounter = gumballCount
        if gumballCount > 0 {
            guard let currentState = noQuarterState else {return}
            state = currentState
        } else {
            guard let currentState = soldOutState else {return}
            state = currentState
        }
    }
    func insertQuarter() {
        if let currentState = state {
            currentState.insertQuarter()
        }
    }
    func ejectQuarter() {
        guard let currentState = state else {return}
        currentState.ejectQuarter()
    }
    func turnCrank() {
        guard let currentState = state else {return}
        currentState.turnCrank()
        state!.dispense()
    }
    func setState(state: State) {
        self.state = state
    }
    func releaseGumball() {
        print("a gumball is rolling out the slot...")
        if gumballCounter != 0 {
            gumballCounter = gumballCounter - 1
        }
    }
    
}

//------------------

let gumballMachineTest = GumballMachine(gumballCount: 5)
gumballMachineTest.insertQuarter()
gumballMachineTest.turnCrank()

gumballMachineTest.insertQuarter()
gumballMachineTest.turnCrank()



