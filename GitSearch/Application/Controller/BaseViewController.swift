//
//  BaseViewController.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 02.11.2020.
//

import UIKit

class BaseViewController: UIViewController {

    private let searchGitView = SearchGitView()
    private let baseNavigationController = BaseNavigationController()
        
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        
        view = searchGitView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavigationController()
    }
    
    // MARK: - Help Functions
    
    private func setupTableView() {
        
        searchGitView.tableView.dataSource = self
        searchGitView.tableView.delegate = self
    }
    
    func setupNavigationController(title: String? = nil, action: Selector? = nil) {
        
        guard let title = title else { return }
        
        baseNavigationController.configureTextTitleNavigationController(title: title, for: self)
        
        guard let action = action else { return }
        
        baseNavigationController.configureBackButton(for: self, action: action)
    }
}

extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
