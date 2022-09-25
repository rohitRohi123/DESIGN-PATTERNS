//
//  Problem 14.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 25/09/22.
//

import Foundation

protocol InsuranceClient {
    var name: String {get set}
    var address: String {get set}
    var number: String {get set}
    // sendMail : Extra feature
    func sendMail()
}

class Resident: InsuranceClient {
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
    
    func sendMail() {
        debugPrint("New deals available on insurance - Sukanya")
    }
}

class Company: InsuranceClient {
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
    
    func sendMail() {
        debugPrint("New deals available for employees")
    }
}


class Bank: InsuranceClient {
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
    
    func sendMail() {
        debugPrint("New insurance deals available for any theft on bank")
    }
}

class Restaurant: InsuranceClient {
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
    
    func sendMail() {
        debugPrint("New insurance deals available for restaurant")
    }
    
}


// Now manager want to add messaging feature
//Added "sendMail" method but it open classes for modification
