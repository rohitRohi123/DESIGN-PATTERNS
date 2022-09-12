//
//  Factory Method - Solution.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 10/09/22.
//

import Foundation

fileprivate protocol Transportation: AnyObject {
    var availableVehicle: [DeliveryVehicle] {get set}
    func delivery()
}

extension Transportation {
    func delivery() {
        let vehicle = availableVehicle.removeFirst()
        vehicle.deliverGoods()
         
        availableVehicle.append(Ship(isVehicleReady: true, name: "RoyalShip", source: "", destination: ""))
    }
    
}


class RohitMultiTransportation {
    //Factory Method
   static func requestForDelivery(with transportationType: String) {
        switch transportationType {
            case "truck":
               RoadTransportation().delivery()
                
            case "ship":
               ShipTransportation().delivery()
            
            default:
                debugPrint("Transportation is not available")
        }
        
    }
     
}

class ShipTransportation: Transportation {
    fileprivate var availableVehicle: [DeliveryVehicle] = [Ship(isVehicleReady: true, name: "RoyalShip", source: "", destination: ""), Ship(isVehicleReady: true, name: "RoyalShip", source: "", destination: ""), Ship(isVehicleReady: true, name: "RoyalShip", source: "", destination: "")]
    
    
}


class RoadTransportation: Transportation {
    fileprivate var availableVehicle: [DeliveryVehicle] = [RTruck(name: "RTruck", source: "", destination: ""), RTruck(name: "RTruck", source: "", destination: ""), RTruck(name: "RTruck", source: "", destination: "")]
}


protocol DeliveryVehicle {
    var isVehicleReady: Bool {get set}
    var name: String {get set}
    var source: String {get set}
    var destination: String {get set}
    
    func deliverGoods()
 }


struct RTruck: DeliveryVehicle {
    var isVehicleReady: Bool = true
    
    var name: String
    
    var source: String
    
    var destination: String
    
    func deliverGoods() {
        debugPrint("Goods Delivered at the destination by R Truck")
    }
}
struct Ship: DeliveryVehicle {
    var isVehicleReady: Bool = true
    
    var name: String
    
    var source: String
    
    var destination: String
    
    func deliverGoods() {
        debugPrint("Goods Delivered at the destination by Ship")
    }
}
