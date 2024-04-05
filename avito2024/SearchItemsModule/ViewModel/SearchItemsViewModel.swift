//
//  SearchItemsViewModel.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import Dispatch

protocol SearchItemsViewModelProtocol {
    
    var coordinator: SearchItemsCoordinatorProtocol? { get }
    var networkManager: NetworkManagerProtocol { get }
    
    func searchItems()
    
    func goToItemDetails()
    
}

final class SearchItemsViewModel: SearchItemsViewModelProtocol {
    
    weak private(set) var coordinator: SearchItemsCoordinatorProtocol?
    private(set) var networkManager: NetworkManagerProtocol
    
    init(coordinator: SearchItemsCoordinatorProtocol) {
        self.coordinator = coordinator
        self.networkManager = NetworkManager()
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
