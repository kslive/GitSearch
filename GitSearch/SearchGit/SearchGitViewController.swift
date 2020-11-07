//
//  SearchGitViewController.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 01.11.2020.
//

import UIKit

class SearchGitViewController: BaseViewController {
        
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
        
        baseView.tableView.dataSource = self
        baseView.tableView.delegate = self
        baseView.tableView.register(SearchGitViewCell.self, forCellReuseIdentifier: String(describing: SearchGitViewCell.self))
    }
    
    private func setupNavigationController() {
        
        baseNavigationController.configureTextTitleNavigationController(title: Constants.title.firstTitle, for: self)
        baseNavigationController.configureButton(for: self, action: #selector(tappedSortButton), image: UIImage(named: Constants.namedImages.sort)!, isRight: true)
    }
}

    // MARK: - Actions

private extension SearchGitViewController {
    
    @objc private func tappedSortButton() {
        print("Tapped Sort Button")
    }
}

    // MARK: - Data Source

extension SearchGitViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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




