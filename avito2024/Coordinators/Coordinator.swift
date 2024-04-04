//
//  Coordinator.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var parentCoordinator: Coordinator? { get }
    var childCoordinators: [Coordinator] { get }
    var navigationController: UINavigationController { get }
    func start()
    
}
