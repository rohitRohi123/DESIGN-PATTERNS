//
//  Problem 13.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 25/09/22.
//

import Foundation

class PaymentService {
    private var paymentMethod: String = ""
    
    func setPayment(method: String) {
        self.paymentMethod = method
        
    }
    
    func payment(with amount: Int) {
        switch paymentMethod {
           case "creditCard":
               debugPrint("Payment from credit card for amount = \(amount)")
            
           case "paypal":
               debugPrint("Payment from paypal for amount = \(amount)")
            
            default:
               print("Invalid payment method");
        }
        
    }
    
}

/*
 Now, we want to add other payment methods
 like apple pay, google pay, and Paytm
 and our payment service class grow
 exponentially and very hard to maintain.
 It also violates Open closed principle.

 It also handling multiple dependency so, it
 also violates the Single Responsibility
 Principle.
 */
