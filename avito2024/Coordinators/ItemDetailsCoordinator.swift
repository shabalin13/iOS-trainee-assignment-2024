//
//  ItemDetailsCoordinator.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import UIKit

protocol ItemDetailsCoordinatorProtocol: AnyObject {
    
    func backToSearchItems()
    
}

final class ItemDetailsCoordinator: Coordinator, ItemDetailsCoordinatorProtocol {
    
    private(set) var parentCoordinator: Coordinator?
    private(set) var childCoordinators: [Coordinator] = []
    private(set) var navigationController: UINavigationController
    
    init(parentCoordinator: Coordinator, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        print("ItemDetailsCoordinator start")
        let viewModel = ItemDetailsViewModel(coordinator: self)
        let viewController = ItemDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func backToSearchItems() {
        guard let parent = parentCoordinator as? SearchItemsCoordinator else { return }
        parent.childDidFinish(childCoordinator: self)
    }
    
    deinit {
        print("ItemDetailsCoorditor deinit")
    }
    
}
