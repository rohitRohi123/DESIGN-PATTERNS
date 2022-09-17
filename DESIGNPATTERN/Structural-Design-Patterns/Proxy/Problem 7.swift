//
//  Problem 7.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 16/09/22.
//

import Foundation

class ATMMachine {
    private var balance: Int = 0
    
    func showBalance() {
        debugPrint("Balance = \(balance)")
    }
    
    func withdraw(money: Int) {
        guard balance > money else {
            return
        }
        
        self.balance -= money
    }
}


class ATMMachineClient {
    let atmMachine = ATMMachine()
    
    func getBalance() {
        atmMachine.showBalance()
        
    }
    
    func withdraw(amount: Int) {
        atmMachine.withdraw(money: amount)
        
    }
}


// We do not want every property or method Private in ATMMachine - Then client can eaisly fetch that property or method
// In future we want to add some restriction on client or then we have to change code in ATMMachine
