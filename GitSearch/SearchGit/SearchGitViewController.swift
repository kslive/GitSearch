//
//  SearchGitViewController.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 01.11.2020.
//

import UIKit

class SearchGitViewController: BaseViewController {
    
    var filteredModel: [String] = []
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

    //MARK: - Help Functions

private extension SearchGitViewController {
    
    private func setup() {
        
        setupTableView()
        setupNavigationController()
    }
    
    private func setupTableView() {
        
        baseView.tableView.register(SearchGitViewCell.self, forCellReuseIdentifier: String(describing: SearchGitViewCell.self))
    }
    
    private func setupNavigationController() {
        
        baseNavigationController.configureTextTitleNavigationController(title: Constants.title.secondTitle, for: self)
        baseNavigationController.configureButton(for: self, action: #selector(tappedSortButton), image: UIImage(named: Constants.namedImages.sort)!, isRight: true)
    }
}

    // MARK: - Actions

private extension SearchGitViewController {
    
    @objc private func tappedSortButton() {
        print("Tapped Sort Button")
    }
}




