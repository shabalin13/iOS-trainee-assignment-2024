//
//  ItemDetailsViewModel.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

protocol ItemDetailsViewModelProtocol {
    
    var coordinator: ItemDetailsCoordinatorProtocol? { get }
    func backToSearchItems()
    
}

final class ItemDetailsViewModel: ItemDetailsViewModelProtocol {
    
    weak private(set) var coordinator: ItemDetailsCoordinatorProtocol?
    
    init(coordinator: ItemDetailsCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func backToSearchItems() {
        coordinator?.backToSearchItems()
    }
    
}
