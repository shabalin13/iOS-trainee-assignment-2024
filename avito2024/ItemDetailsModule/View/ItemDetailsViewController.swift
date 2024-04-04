//
//  ItemDetailsViewController.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    
    private let viewModel: ItemDetailsViewModelProtocol
    
    init(viewModel: ItemDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("This class does not support NSCoder")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.backToSearchItems()
    }

}
