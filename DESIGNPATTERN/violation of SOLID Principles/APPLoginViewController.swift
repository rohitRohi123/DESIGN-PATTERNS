//
//  APPLoginViewController.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 16/11/22.
//

import UIKit

class APPLoginViewController: UIViewController {
    @IBOutlet weak var emailTextF: UITextField!
    @IBOutlet weak var passwordTextF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var gmailButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var linkdinButton: UIButton!
    
    enum LoginType {
        case email, google, facebook, linkdin
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeViewCircular(view: gmailButton)
        makeViewCircular(view: facebookButton)
        makeViewCircular(view: linkdinButton)
    }
    
    private func makeViewCircular(view: UIView) {
        view.layer.cornerRadius = view.bounds.size.width / 2
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.blue.cgColor
    }
    
    @IBAction func didClickedLogin(_ sender: Any) {
        login(with: .email)
    }
    
    @IBAction func didClickedGoogle(_ sender: Any) {
        login(with: .google)
    }
    
    @IBAction func didClickedFacebook(_ sender: Any) {
        login(with: .facebook)
    }
    
    @IBAction func didClickedLinkdin(_ sender: Any) {
        login(with: .linkdin)
    }
    
    
    private func login(with loginType: LoginType) {
        switch loginType {
            case .email:
                debugPrint("Code for Email Login")
            
            case .google:
                debugPrint("Code for Google Login")
            
            case .facebook:
                debugPrint("Code for Google Login")
            
            case .linkdin:
                debugPrint("Code for Linkdin")
        }
        
    }
    
}


// - This class is not following SINGLE RESPONSIBILITY PRINCIPLE, because controller manage view life cycle, View Representation and All Login Handling
// - In future if you want to add LOGIN WITH APLLE then you have you modify existing code so, it is also not following OPEN CLOSED Principle.
