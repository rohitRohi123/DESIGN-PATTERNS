//
//  BuyCoordinator.swift
//  CoordinatorPattern
//
//  Created by Rohit Chauhan on 17/12/22.
//

import UIKit

//MARK:- Child Coordinator
class BuyCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func bySubscriptions(to productType: Int) {
        let vc = BuyViewController.instantiate()
        vc.selectedProduct = productType
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
//    func didFinishBuying() {
//        self.parentCoordinator?.childDidFinish(self)
//    }
}
