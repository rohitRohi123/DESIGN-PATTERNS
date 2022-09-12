//
//  Abstract Factory Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 11/09/22.
//

import Foundation


//Client Code
/*
  let factory = RohitAssemblyPVT()
  factory.getCar(of: "tata")
 
 */


protocol AbstractVehicleFactory {
    func getCar()-> CarProtocol
    func getBike()-> BikeProtocol
}

struct RohitAssemblyPVT {
    func getCar(of company: String)-> CarProtocol? {
        if company == "tata" {
            return TataVehicleAssemblyFactory().getCar()
        }
        
        if company == "Maruti" {
            return MarutiVehicleAssemblyFactory().getCar()
        }
        
        debugPrint("Vehicle is not available")
        return nil
    }
    
    func getBike(of company: String)-> BikeProtocol? {
        if company == "Tata" {
            return TataVehicleAssemblyFactory().getBike()
        }
        
        if company == "Maruti" {
            return MarutiVehicleAssemblyFactory().getBike()
        }
        
        debugPrint("Vehicle is not available")
        return nil
        
    }
}


struct TataVehicleAssemblyFactory: AbstractVehicleFactory {
    func getCar() -> CarProtocol {
        return Car(name: "Tata Harrier", brandName: "Tata")
    }
    
    func getBike() -> BikeProtocol {
        return Bike(name: "Beast", brandName: "Tata")
    }
}

struct MarutiVehicleAssemblyFactory: AbstractVehicleFactory {
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

