//
//  HomeViewController.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 16/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigateToLoginVc()
    }
    
    private func navigateToLoginVc() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "APPLoginViewController") as? APPLoginViewController else {
            return
        }
        
        vc.modalPresentationStyle = .overFullScreen
        
        self.present(vc, animated: false)
        
    }
}
