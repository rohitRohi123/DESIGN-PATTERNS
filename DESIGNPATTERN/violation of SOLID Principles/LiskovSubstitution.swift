//
//  LiskovSubstitution.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 09/11/22.
//

import Foundation


//Angry Bird Game
class AngryBird {
    private var birdStack: Array<Bird>
    
    init(with birds: [Bird]) {
        self.birdStack = birds
    }
    
    func loadAndHitTarget() {
        guard !birdStack.isEmpty else {
            debugPrint("Game Over")
            return
        }
        
        let bird = birdStack.removeFirst()
        bird.fly()
    }
    
}

protocol BirdProtocol {
    var name: String {get set}
    func eat(food: String)
    func fly()
}

//MARK: - Liskov Substitution - Violation
class Bird: BirdProtocol {
    var name: String
    init(with name: String) {
        self.name = name
    }
    
    func eat(food: String) {
          debugPrint("Eating = \(food)")
    }
    
    func fly() {
        debugPrint("Flying")
    }
    
}

class Parrot: Bird {
    override init(with name: String = "Red") {
        super.init(with: name)
    }
    
}


class Eagle: Bird {
    override init(with name: String = "Mighty Eagle") {
        super.init(with: name)
    }
    
}

class Ostrich: Bird {
    override init(with name: String = "XYZ") {
        super.init(with: name)
    }
    
}





//MARK: Interface Segregation
protocol SBirdProtocol {
    var name: String {get set}
    func eat(food: String)
    func fly()   // This is extra method in this interface.
}


//MARK: - Dependency Inversion Principle
//Ex: Problem
struct ABCTruck {
   var capacity: Double
   var name: String
   var id: String
   var source: String
   var destination: String
    func startDelivery() {}
    
}

class ABCTransport {
   var transportVehicle: [ABCTruck] = []
     
     func startDelivery(source: String, destination: String) {
         guard transportVehicle.count > 0 else {
             debugPrint("Vehicle is not available")
             return
          }
         
          var vehicle = transportVehicle.removeFirst()
          vehicle.source = source
          vehicle.destination = destination
          vehicle.startDelivery()
    }
    
    func trackDelivery(for vehicle: ABCTruck) {

    }
    
    func completeDelivery(for vehicle: ABCTruck) {

    }
}

/*Now business unit want to support, water transport, and air transport. Now we
 need to completely modify our app because of concrete Truck object.*/

//Solution:
 protocol SABCVehicle {
     var capacity: Double { get set }
     var name: String { get set }
     var id: String { get set }
     var source: String { get set }
     var destination: String { get set }
     func startDelivery()
}

class SABCTransport {
   var transportVehicle: [SABCVehicle] = []
     
     func delivery(source: String, destination: String) {
         guard transportVehicle.count > 0 else {
             debugPrint("Vehicle is not available")
             return
          }
         
          var vehicle = transportVehicle.removeFirst()
          vehicle.source = source
          vehicle.destination = destination
          vehicle.startDelivery()
    }
    
    func trackDelivery(for vehicle: SABCVehicle) {

    }
    
    func completeDelivery(for vehicle: SABCVehicle) {

    }
}
