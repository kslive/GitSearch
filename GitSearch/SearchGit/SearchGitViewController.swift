//
//  SearchGitViewController.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 01.11.2020.
//

import UIKit

class SearchGitViewController: BaseViewController {
    
    private var users = [User]()
        
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
        setupSearchController()
        setupNavigationController()
    }
    
    private func setupTableView() {
        
        baseView.tableView.dataSource = self
        baseView.tableView.delegate = self
        baseView.tableView.register(SearchGitViewCell.self, forCellReuseIdentifier: String(describing: SearchGitViewCell.self))
    }
    
    private func setupSearchController() {
        
        baseView.searchController.searchResultsUpdater = self
        baseView.searchController.obscuresBackgroundDuringPresentation = false
        baseView.searchController.searchBar.placeholder = "Search Users"
        navigationItem.searchController = baseView.searchController
        definesPresentationContext = true
    }
    
    private func setupNavigationController() {
        
        baseNavigationController.configureTextTitleNavigationController(title: Constants.title.firstTitle, for: self)
        baseNavigationController.configureButton(for: self, action: #selector(tappedSortButton), image: UIImage(named: Constants.namedImages.sort)!, isRight: true)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        users = users.filter{ (group: User) -> Bool in
            
            guard let name = group.name else { return false }
            return name.contains(searchText)
        }
        
        baseView.tableView.beginUpdates()
        baseView.tableView.endUpdates()
    }
}

    // MARK: - Actions

private extension SearchGitViewController {
    
    @objc private func tappedSortButton() {
    }
}

    // MARK: Search Bar Delegate

extension SearchGitViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = baseView.searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

    // MARK: - Data Source

extension SearchGitViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count + 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        default: return searchProfileCell(in: tableView, at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        default: return view.frame.height / 12
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let profileGitController = ProfileGitController()
        
        if indexPath == tableView.indexPathForSelectedRow {
            
            present(profileGitController, animated: true)
        }
    }
}

    //MARK: - Cells

extension SearchGitViewController {
    
    func searchProfileCell(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchGitViewCell = tableView.dequeueCell(at: indexPath)
        
        return cell
    }
}




