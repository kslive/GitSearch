//
//  SearchGitView.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 02.11.2020.
//

import UIKit

class SearchGitView: UIView {
    
    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Help Functions
    
    private func setupTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)
    }
    
}
