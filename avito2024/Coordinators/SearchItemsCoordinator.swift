//
//  SearchItemsCoordinator.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import UIKit

protocol SearchItemsCoordinatorProtocol: AnyObject {
    
    func goToItemDetails()
    func childDidFinish(childCoordinator: Coordinator)
    
}

final class SearchItemsCoordinator: Coordinator, SearchItemsCoordinatorProtocol {
    
    private(set) var parentCoordinator: Coordinator?
    private(set) var childCoordinators: [Coordinator] = []
    private(set) var navigationController: UINavigationController
    
    init(parentCoordinator: Coordinator, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        print("SearchItemsCoordintor start")
        let viewModel = SearchItemsViewModel(coordinator: self)
        let viewController = SearchItemsViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func goToItemDetails() {
        let itemDetailsCoordinator = ItemDetailsCoordinator(parentCoordinator: self, navigationController: navigationController)
        childCoordinators.append(itemDetailsCoordinator)
        itemDetailsCoordinator.start()
    }
    
    func childDidFinish(childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
    deinit {
        print("SearchItemsCoordinator deinit")
    }
    
}
