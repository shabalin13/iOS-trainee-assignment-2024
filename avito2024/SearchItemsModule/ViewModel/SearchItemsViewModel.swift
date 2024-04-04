//
//  SearchItemsViewModel.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

protocol SearchItemsViewModelProtocol {
    
    var coordinator: SearchItemsCoordinatorProtocol? { get }
    func goToItemDetails()
    
}

final class SearchItemsViewModel: SearchItemsViewModelProtocol {
    
    weak private(set) var coordinator: SearchItemsCoordinatorProtocol?
    
    init(coordinator: SearchItemsCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func goToItemDetails() {
        coordinator?.goToItemDetails()
    }
    
}
