//
//  Visitor Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 25/09/22.
//

import Foundation

protocol VInsuranceClient {
    var name: String {get set}
    var address: String {get set}
    var number: String {get set}
    func accept(visitor: VisitorProtocol)
}

class VResident: VInsuranceClient {
    var name: String
    var address: String
    var number: String
    
    private(set) var insuranceClass: String
    
    init(name: String,
         address: String,
         number: String,
         insuranceClass: String) {
        self.name = name
        self.address = address
        self.number = number
        self.insuranceClass = insuranceClass
    }

    func accept(visitor: VisitorProtocol) {
        visitor.visitResident()
    }
}

class VCompany: VInsuranceClient {
    var name: String
    var address: String
    var number: String
    
    private(set) var noOfEmp: Int
    
    init(name: String,
         address: String,
         number: String,
         noOfEmp: Int) {
        self.name = name
        self.address = address
        self.number = number
        self.noOfEmp = noOfEmp
    }
    
    func accept(visitor: VisitorProtocol) {
        //Visitor object called its method, - this in called Double dispatch.
        visitor.visitCompany()
    }
}


class VBank: VInsuranceClient {
    var name: String
    var address: String
    var number: String
    
    private(set) var branchesInsured: Int
    
    init(name: String,
         address: String,
         number: String,
         branchesInsured: Int) {
        self.name = name
        self.address = address
        self.number = number
        self.branchesInsured = branchesInsured
    }
    
    func accept(visitor: VisitorProtocol) {
        visitor.visitBank()
    }
}

class VRestaurant: VInsuranceClient {
    var name: String
    var address: String
    var number: String
    
    private(set) var availableAbroad: Bool
    
    init(name: String,
         address: String,
         number: String,
         availableAbroad: Bool) {
        self.name = name
        self.address = address
        self.number = number
        self.availableAbroad = availableAbroad
    }
    
    func accept(visitor: VisitorProtocol) {
        visitor.visitRestaurant()
    }
}

protocol VisitorProtocol {
    func visitResident()
    func visitBank()
    func visitRestaurant()
    func visitCompany()
}

struct MessangingVisitor: VisitorProtocol {
    func visitResident() {
        debugPrint("Sending mail about medical insurance...")
    }
    
    func visitBank() {
        debugPrint("Sending mail about theft insurance...")
    }
    
    func visitRestaurant() {
        debugPrint("Sending mail about fire and food insurance...")
    }
    
    func visitCompany() {
        debugPrint("Sending mail about employee and asset insurance...")
        
    }
    
}
