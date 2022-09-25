//
//  State Pattern Case 2.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 24/09/22.
//

import Foundation

class Phone {
    private var state: PhoneStateProtocol?
    
    fileprivate func setState(with state: PhoneStateProtocol) {
        self.state = state
    }
    
    func didClickedOff() {
        self.state?.offButton()
    }
    
    func didClickedHome() {
        self.state?.homeButton()
    }
}

struct LockState: PhoneStateProtocol {
    private var phone: Phone
    
    init(with phone: Phone) {
        self.phone = phone
    }
    
    func offButton() {
        debugPrint("Active phone")
    }
    
    func homeButton() {
        debugPrint("Activate phone")
        phone.setState(with: UnLockState(with: phone))
        
    }
}

struct UnLockState: PhoneStateProtocol {
    private var phone: Phone
    
    init(with phone: Phone) {
        self.phone = phone
    }
    
    func offButton() {
        debugPrint("Lock phone")
        phone.setState(with: LockState(with: phone))
    }
    
    func homeButton() {
        debugPrint("Ready to executing any operation")
        phone.setState(with: RunningState(with: phone))
    }
}

struct RunningState: PhoneStateProtocol {
    private var phone: Phone
    
    init(with phone: Phone) {
        self.phone = phone
    }
    
    func offButton() {
        debugPrint("Lock phone")
        phone.setState(with: LockState(with: phone))
    }
    
    func homeButton() {
        debugPrint("Do nothing")
    }
}

protocol PhoneStateProtocol {
    func offButton()
    func homeButton()
}
