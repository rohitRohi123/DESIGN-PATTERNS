//
//  Coordinator.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 17/12/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
