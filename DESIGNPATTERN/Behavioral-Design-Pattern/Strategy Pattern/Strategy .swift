//
//  Strategy .swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 25/09/22.
//

import Foundation

class SPaymentService {
    private var paymentService: PaymentServiceProtocol?

    func setPaymentSevice(with paymentService: PaymentServiceProtocol) {
        self.paymentService = paymentService
    }
    
    func processOrder(with amount: Int) {
        self.paymentService?.collectPaymentDetails()
        
        guard self.paymentService?.validatePayment() ?? false else {
            return
        }
        
        self.paymentService?.payment(with: amount)
    }
}


protocol PaymentServiceProtocol {
    func payment(with amount: Int)
    func collectPaymentDetails()
    func validatePayment()-> Bool
}


struct PaymentByPaypal: PaymentServiceProtocol {
    func payment(with amount: Int) {
        debugPrint("Payment done for amount from paypal = \(amount)")
    }
    
    func validatePayment() -> Bool {
        return true
    }
    
    func collectPaymentDetails() {
       debugPrint("Collectect payment details")
        
    }
    
}

struct PaymentByGooglePay: PaymentServiceProtocol {
    func payment(with amount: Int) {
        debugPrint("Payment done for amount from google pay = \(amount)")
    }
    
    func validatePayment() -> Bool {
        return true
    }
    
    func collectPaymentDetails() {
       debugPrint("Collectect payment details")
        
    }
    
}

struct PaymentByCard: PaymentServiceProtocol {
    func payment(with amount: Int) {
        debugPrint("Card payment done for amount = \(amount)")
    }
    
    func validatePayment() -> Bool {
        return true
    }
    
    func collectPaymentDetails() {
       debugPrint("Collectect payment details")
        
    }
    
}
