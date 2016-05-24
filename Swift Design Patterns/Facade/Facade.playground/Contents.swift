//: Playground - noun: a place where people can play

import UIKit

struct Amplifier {

    func on() {
        print("turn on amplifier")
    }

    func off() {
        print("turn off amplifier")
    }
}

struct Tuner {}
struct DvdPlayer {
    func on() {
        print("turn on DVD Player")
    }
    func play(dvd: DvdPlayer) {
        print("play movie")
    }
    func off() {
        print("turn off DVD Player")
    }
}
struct Projector {
    func on() {
        print("turn on projector")
    }
    func wideScreen(){
        print("switch projector to widescreen mode")
    }
    func off() {
        print("turn off projector")
    }
}
struct TheaterLights {
    func dim(lightLevel: Int){
        print("dim light level to \(lightLevel)")
    }
}
struct Screen {
    func down(){
        print("Big screen comes down")
    }
    func up() {
        print("big screen goes up")
    }
}
struct SurroundSound {
    func on() {
        print("turn on surround sound")
    }
    func off() {
        print("turn off surround sound")
    }
}
struct PopcornPopper {
    func on() {
        print("turn on popcorn machine")
    }
    func pop() {
        print("begin popping popcorn")
    }
    func off() {
        print("turn off popcorn machine")
    }
}

class HomeTheaterFacade {
    var amp: Amplifier
    var tuner: Tuner
    var dvd: DvdPlayer
    var projector: Projector
    var lights: TheaterLights
    var screen: Screen
    var sound: SurroundSound
    var popper: PopcornPopper
    
    init(amp: Amplifier, tuner: Tuner, dvd: DvdPlayer, projector: Projector, lights: TheaterLights, screen: Screen, sound: SurroundSound, popper: PopcornPopper){
        self.amp = amp
        self.tuner = tuner
        self.dvd = dvd
        self.projector = projector
        self.lights = lights
        self.screen = screen
        self.sound = sound
        self.popper = popper
    }
    
    func watchMovie(movieTitle: String) {
        print("get ready to watch \(movieTitle)")
        popper.on()
        popper.pop()
        lights.dim(13)
        screen.down()
        projector.on()
        projector.wideScreen()
        amp.on()
        sound.on()
        dvd.on()
        dvd.play(dvd)
    }
    
}

struct HomeCinema {
    
}