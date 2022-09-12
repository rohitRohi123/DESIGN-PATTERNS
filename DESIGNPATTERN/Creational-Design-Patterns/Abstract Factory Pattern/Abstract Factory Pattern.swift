//
//  Abstract Factory Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 11/09/22.
//

import Foundation


//Client Code
/*
  let factory = VehicleAbstractFactory.createFactory(for: "tata")
  factory.getCar()
 */

struct VehicleAbstractFactory {
    static func createFactory(for company: String)-> IVehicleFactory? {
        if company.lowercased() == "tata" {
            return TataVehicleAssemblyFactory()
        }
        
        if company.lowercased() == "maruti" {
            return MarutiVehicleAssemblyFactory()
        }
        
        return nil
    }
}

protocol IVehicleFactory {
    func getCar()-> CarProtocol
    func getBike()-> BikeProtocol
}

struct TataVehicleAssemblyFactory: IVehicleFactory {
    func getCar() -> CarProtocol {
        return Car(name: "Tata Harrier", brandName: "Tata")
    }
    
    func getBike() -> BikeProtocol {
        return Bike(name: "Beast", brandName: "Tata")
    }
}

struct MarutiVehicleAssemblyFactory: IVehicleFactory {
    func getCar() -> CarProtocol {
        return Car(name: "Maruti Car Ciaz", brandName: "Maruti")
    }
    
    func getBike() -> BikeProtocol {
        return Bike(name: "Suzuki", brandName: "Maruti")
    }
    
}


//MARK: - Product Assembly area
protocol Vehicle {
    var name: String {get set}
    var brandName: String {get set}
    var numberOfTyre: Int {get set}
    func createVehicle()-> Self
}

protocol CarProtocol: Vehicle {}

protocol BikeProtocol: Vehicle {}

struct Bike: BikeProtocol {
    var name: String
    var brandName: String
    var numberOfTyre: Int = 2
    func createVehicle() -> Bike {
        debugPrint("\(brandName) Created")
        return self;
    }
}

struct Car: CarProtocol {
    var name: String
    var brandName: String
    var numberOfTyre: Int = 4
    func createVehicle() -> Car {
        debugPrint("\(brandName) Created")
        return self;
    }
}

