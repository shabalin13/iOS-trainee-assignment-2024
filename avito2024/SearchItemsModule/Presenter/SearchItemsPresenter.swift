//
//  SearchItemsPresenter.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import Dispatch

protocol SearchItemsPresenterProtocol {
    
    func searchItems()
    func goToItemDetails()
    
}

final class SearchItemsPresenter: SearchItemsPresenterProtocol {
    
    weak private var coordinator: SearchItemsCoordinatorProtocol?
    weak private var viewController: SearchItemsViewControllerProtocol?
    private let networkManager: NetworkManagerProtocol
    
    init(coordinator: SearchItemsCoordinatorProtocol) {
        self.coordinator = coordinator
        self.networkManager = NetworkManager()
    }
    
    func setViewController(viewController: SearchItemsViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func searchItems() {
        DispatchQueue.global().async {
            let itemParameters = ItemParameters(term: "Harry-Potter")
            self.networkManager.searchItems(itemParameters: itemParameters) { result in
                switch result {
                case .success(let items):
                    print(items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func goToItemDetails() {
        coordinator?.goToItemDetails()
    }
    
}
