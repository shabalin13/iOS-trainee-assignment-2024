//
//  SearchItemsViewController.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import UIKit

protocol SearchItemsViewControllerProtocol: AnyObject {
    
}

class SearchItemsViewController: UIViewController {
    
    private let presenter: SearchItemsPresenterProtocol
    
    private lazy var searchController = UISearchController(searchResultsController: SearchResultsViewController())
    
//    private lazy var collectionView = createCollectionView()
//    private lazy var dataSource = createDataSource()
    
    init(presenter: SearchItemsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("This class does not support NSCoder")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemBackground
        
        setupNavigationBar()
        setupSearchController()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Медиа-контент"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(setFilters))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(goToItemDetails))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchItems))
    }
    
    private func setupSearchController() {
        self.navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Поиск медиа-контента"
//        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc func setFilters(_ sender: UIBarButtonItem) {
        print("Filter button clicked")
    }
    
    @objc func searchItems() {
        presenter.searchItems()
    }
    
    @objc func goToItemDetails(_ sender: UIBarButtonItem) {
        presenter.goToItemDetails()
    }

}

extension SearchItemsViewController: SearchItemsViewControllerProtocol {
    
}

extension SearchItemsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}
