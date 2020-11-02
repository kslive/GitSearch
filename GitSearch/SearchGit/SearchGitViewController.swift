//
//  SearchGitViewController.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 01.11.2020.
//

import UIKit

class SearchGitViewController: BaseViewController {
    
    var model = ["sdfsf", "sdfsdf"]
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // MARK: - Methods
    
    override func setupNavigationController(title: String? = nil, action: Selector! = nil) {
        super.setupNavigationController(title: Constants.firstTitle, action: action)
    }
        
    //MARK: - Help Functions
    
    private func setupTableView() {
        
        baseView.tableView.dataSource = self
        baseView.tableView.delegate = self
        baseView.tableView.register(SearchGitViewCell.self, forCellReuseIdentifier: "SearchGitViewCell")
    }
}

extension SearchGitViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchGitViewCell", for: indexPath)
        
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
}


