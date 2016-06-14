//: Playground - noun: a place where people can play

import UIKit

protocol Command {
    func execute()
}

class Light {
    func on(){
        print("turn light on")
    }
}

struct LightOnCommand: Command {
    let light: Light
    
    init(light:Light) {
        self.light = light
    }
    
    func execute() {
        light.on()
    }
}

class SimpleRemoteControl {
    var slot: Command?
    
    func setCommand(command:Command){
        slot = command
    }
    
    func buttonPressed(){
        slot!.execute()
    }
}

let remote = SimpleRemoteControl()
let light = Light()
let turnOnLight = LightOnCommand(light: light)

remote.setCommand(turnOnLight)
remote.buttonPressed()
