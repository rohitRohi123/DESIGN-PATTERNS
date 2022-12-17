//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by Rohit Chauhan on 17/12/22.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedBuySubscription(_ sender: Any) {
        coordinator?.buySubscription(to: segmentControl.selectedSegmentIndex)
    }
    
    @IBAction func clickedCreateAccount(_ sender: Any) {
        coordinator?.createAccount()
    }
    
}

