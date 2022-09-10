//
//  Problem1.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 10/09/22.
//

import Foundation

///Factory method come to resolve this problem
///PROBLEM

struct Truck {
    var isReadyForDelivery: Bool = false
    
    mutating func dileveredGoods() {
        debugPrint("Goods delivered")
        self.isReadyForDelivery = true
    }
    
}


class RohitTransportation {
    var availableVehicles:[Truck] = [Truck(isReadyForDelivery: true),
                                   Truck(isReadyForDelivery: true),
                                   Truck(isReadyForDelivery: true)];
    
    func requestForDelivery() {
        var truck = availableVehicles.removeFirst()
        truck.dileveredGoods()
        
        availableVehicles.append(Truck(isReadyForDelivery: true))
    }
}


//Now after a while our app become popular and request from other transport companies to add "Ship" transportation.
// Now we have to change our codebase to add Ship transportation also.

