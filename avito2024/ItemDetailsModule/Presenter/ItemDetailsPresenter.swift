//
//  ItemDetailsPresenter.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

protocol ItemDetailsPresenterProtocol {
    
    func backToSearchItems()
    
}

final class ItemDetailsPresenter: ItemDetailsPresenterProtocol {
    
    weak private var coordinator: ItemDetailsCoordinatorProtocol?
    weak private var viewController: ItemDetailsViewControllerProtocol?
    
    init(coordinator: ItemDetailsCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func setViewController(viewController: ItemDetailsViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func backToSearchItems() {
        coordinator?.backToSearchItems()
    }
    
}
