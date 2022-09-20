//
//  Problem 9.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 20/09/22.
//

import Foundation

// Suppose we are going to create a online ordering system
// Client can order from our application
// But before complete order, its request go through some authentication & authorization
// It ording process should follow sequestial steps

class OrderManager {
    func requestOrder(with userId: Int) {
        checkUserAuthetication()
        checkStock()
        checkUserWallet()
    }
    
    private func checkUserAuthetication() {
        
    }
    
    private func checkStock() {
        
    }
    
    private func checkUserWallet() {
        
    }
}

//Problems:
// For Some order we need to change sequence of steps.
// If we need to add more & more features, our code became very hard to handle
// Because we can not change the order of execution steps of some oders so, it's tightly coupled
