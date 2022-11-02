//
//  Problem 10.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 24/09/22.
//

import Foundation
import UIKit

class RagistrationForm {
    var name: UITextField?
    var phoneNum: UITextField?
    var email: UITextField?
    var username: UITextField?
    var password: UITextField?
    
    @IBAction func didClickedSubmit(sender: UIButton) {
        //validate Name
        //validate PhoneNum
        //validate Email
        //validate Username
        //validate Password
    }
    /*
     As you can see in didClickedSubmit func, on submit button we are validating form
     So, if in future we want to strong Password validation then we have to modify this class.
     */
}
