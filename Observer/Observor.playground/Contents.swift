//: Playground - noun: a place where people can play

import UIKit

private extension Selector {
    //private because we only want this accessable to this file
    static let notificationToPost = #selector(Weather.setTemperature(_:))
}

class Weather {
    let temperatureNotification = "temperatureChangeNotification"
    let weatherBroadcast = NSNotificationCenter.defaultCenter()
    
    func startObserving() {
        print("setup observer")
//        weatherBroadcast.addObserver(
//            self,
//            selector: #selector(Weather.setTemperature(_:)),
//            name: temperatureNotification,
//            object: nil)
        weatherBroadcast.addObserver(
            self,
            selector: .notificationToPost,
            name: temperatureNotification,
            object: nil)
    }
    
    @objc func setTemperature(notification: NSNotification) {
        guard let newTemp = notification.object else {return}
        print("temperature changed \(newTemp)")
        
    }
    
    func notifyObserver(tempChange: [String: Float]) {
        weatherBroadcast.postNotificationName(temperatureNotification, object: tempChange)
        print("notified observer")
    }
    
    func removeObserver() {
        print("remove observer")
        weatherBroadcast.removeObserver(self)
    }
}

let weather = Weather()
weather.startObserving()
weather.notifyObserver(["San Diego, CA" : 87.2])
//weather.notifyObserver(["Detroit, MI" : 75.9])

weather.removeObserver()