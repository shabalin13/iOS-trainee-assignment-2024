//
//  AppCoordinator.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private(set) var parentCoordinator: Coordinator?
    private(set) var childCoordinators: [Coordinator] = []
    private(set) var navigationController = UINavigationController()
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let searchItemsCoordinator = SearchItemsCoordinator(parentCoordinator: self, navigationController: navigationController)
        childCoordinators.append(searchItemsCoordinator)
        searchItemsCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
