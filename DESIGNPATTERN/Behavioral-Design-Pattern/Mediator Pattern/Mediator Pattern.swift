//
//  Mediator Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 24/09/22.
//

import Foundation
import UIKit

protocol MediatorProtocol {
    func validateForm(with form: Form)
}

class FormMediator: MediatorProtocol {
    func validateForm(with form: Form) {
        // Validate form and perform action according to form validation
        
    }
    
}

class Form {
    private var mediator: MediatorProtocol?
    init(with mediator: MediatorProtocol) {
        self.mediator = mediator
    }
    
    var name: UITextField?
    var phoneNum: UITextField?
    var email: UITextField?
    var username: UITextField?
    var password: UITextField?
 
    @IBAction func onClickedSubmit(sender: UIButton) {
        self.mediator?.validateForm(with: self)
        // Now you can see submit button is not coupled with any form validation
        // And we extend the validation logic at any time without affecting Form.
    }
}
