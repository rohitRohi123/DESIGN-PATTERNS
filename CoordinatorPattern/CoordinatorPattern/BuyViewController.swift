//
//  BuyViewController.swift
//  CoordinatorPattern
//
//  Created by Rohit Chauhan on 17/12/22.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
    weak var coordinator: BuyCoordinator?
    var selectedProduct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("Selected Product = \(selectedProduct)")
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        coordinator?.didFinishBuying()
//    }

}
