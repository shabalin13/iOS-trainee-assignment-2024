//
//  ItemDetailsViewController.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import UIKit

protocol ItemDetailsViewControllerProtocol: AnyObject {
    
}

class ItemDetailsViewController: UIViewController {
    
    private let presenter: ItemDetailsPresenterProtocol
    
    init(presenter: ItemDetailsPresenterProtocol) {
        self.presenter = presenter
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
        presenter.backToSearchItems()
    }

}

extension ItemDetailsViewController: ItemDetailsViewControllerProtocol {
    
}
