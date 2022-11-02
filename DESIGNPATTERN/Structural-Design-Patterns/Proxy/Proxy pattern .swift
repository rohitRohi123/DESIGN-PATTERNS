//
//  Proxy pattern .swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 16/09/22.
//

import Foundation

protocol ATMInterface {
    func showBalance()
    func withdraw(amount: Int)
}

fileprivate class ATMMachine_Sol: ATMInterface {
    private var balance: Int = 0
    
    func showBalance() {
        debugPrint("Available balance = \(balance)")
    }
    
    func withdraw(amount: Int) {
        guard balance > amount else {
            debugPrint("Insufficient balance")
            return
        }
        
        self.balance -= amount
    }
}

open class ATMMachineProxy: ATMInterface {
    private var atmMachine: ATMInterface?
    
    init() {
        atmMachine = ATMMachine_Sol()
    }
    
    convenience init(atmMachine: ATMInterface) {
        self.init()
        self.atmMachine = atmMachine
    }
    
    func showBalance() {
        debugPrint("Available Balance = \(atmMachine?.showBalance())")
    }
    
    func withdraw(amount: Int) {
        atmMachine?.withdraw(amount: amount)
    }
}

/*
let atmMachine = ATMMachineProxy()
atmMachine.showBalance()
 atmMachine.withdraw(amount: 1000)
 */
