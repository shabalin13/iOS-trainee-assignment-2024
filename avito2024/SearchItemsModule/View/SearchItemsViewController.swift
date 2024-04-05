//
//  SearchItemsViewController.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import UIKit

class SearchItemsViewController: UIViewController {
    
    private let viewModel: SearchItemsViewModelProtocol
    
    init(viewModel: SearchItemsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("This class does not support NSCoder")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(goToItemDetails))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchItems))
    }
    
    
    @objc func searchItems() {
        viewModel.searchItems()
    }
    
    @objc func goToItemDetails(_ sender: UIBarButtonItem) {
        viewModel.goToItemDetails()
    }

}
