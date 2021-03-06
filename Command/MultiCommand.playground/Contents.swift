//: Playground - noun: a place where people can play

import UIKit

protocol Command {
    func execute()
    func undo()
}
//to make it easier to understand, actions are structs while devices are classes. You are not going to inherit an action, but you could inherit a device... like iPhone inherits from iPod, for example
class iPod {
    var volumeLevel = 0
    
    func off(){
        print("turn iPod off")
    }
    func on(){
        print("turn iPod on")
    }
    
    func increaseVolume() {
        volumeLevel += 1
        print("increase iPod volume level to \(volumeLevel)")
    }
    func decreaseVolume() {
        volumeLevel -= 1
        print("decrease iPod volume level to \(volumeLevel)")
    }
}

struct TurnOniPodCommand: Command {
    let oldiPod: iPod
    
    init(choseniPod: iPod) {
        oldiPod = choseniPod
    }
    
    func execute() {
        oldiPod.on()
    }
    
    func undo() {
        oldiPod.off()
    }
}

struct TurnOffiPodCommand: Command {
    let oldiPod: iPod
    
    init(choseniPod:iPod) {
        oldiPod = choseniPod
    }
    
    func execute() {
        oldiPod.off()
    }
    func undo() {
        oldiPod.on()
    }
}

struct IncreaseiPodVolumeCommand: Command {
    let oldiPod: iPod
    
    init(choseniPod:iPod) {
        oldiPod = choseniPod
    }
    
    func execute() {
        oldiPod.increaseVolume()
    }
    func undo() {
        oldiPod.decreaseVolume()
    }
}

class RemoteControlApp {
    // the app controller knows nothing. It doesn't know what command is being used or what device recieves command action
    
    var selectedCommand: Command
    
    init(command:Command){
        selectedCommand = command
    }
    
    func buttonPressed() {
        selectedCommand.execute()
    }
    
    func undoButtonPressed() {
        selectedCommand.undo()
    }
}

//----------------
let myiPod = iPod()
let turnOn = TurnOniPodCommand(choseniPod: myiPod)

let appRemoteControl = RemoteControlApp(command: turnOn)
appRemoteControl.buttonPressed()

let turnUpVolume = IncreaseiPodVolumeCommand(choseniPod: myiPod)
appRemoteControl.selectedCommand = turnUpVolume
appRemoteControl.buttonPressed()
appRemoteControl.buttonPressed()
appRemoteControl.buttonPressed()
appRemoteControl.undoButtonPressed()

