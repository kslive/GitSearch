//
//  ProfileGitController.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 06.11.2020.
//

import UIKit

class ProfileGitController: BaseViewController {
    
    private var isTappedButton: Bool = false
    private var selectedIndex: IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

//MARK: - Help Functions

private extension ProfileGitController {
    
    private func setup() {
        
        setupTableView()
        setupNavigationController()
    }
    
    private func setupTableView() {
        
        baseView.tableView.dataSource = self
        baseView.tableView.delegate = self
        baseView.tableView.register(ProfileInfoCell.self, forCellReuseIdentifier: String(describing: ProfileInfoCell.self))
        baseView.tableView.register(RepoInfoCell.self, forCellReuseIdentifier: String(describing: RepoInfoCell.self))
    }
    
    private func setupNavigationController() {
        
        baseNavigationController.configureTextTitleNavigationController(title: Constants.title.secondTitle, for: self)
        baseNavigationController.configureButton(for: self, action: #selector(tappedBackButton), image: UIImage(named: Constants.namedImages.back)!, isRight: false)
    }
}

    // MARK: - Actions

private extension ProfileGitController {
    
    @objc private func tappedBackButton() {
        
        self.dismiss(animated: true)
    }
}

    // MARK: - Data Source

extension ProfileGitController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0: return profileInfoCell(in: tableView, at: indexPath)
        default: return repoInfoCell(in: tableView, at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return view.frame.height / 3
        default:
            if indexPath == selectedIndex && isTappedButton {
                return view.frame.height / 9
            } else {
                return view.frame.height / 15
            }
        }
    }
}

    //MARK: - Cells

extension ProfileGitController {
    
    func profileInfoCell(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell: ProfileInfoCell = tableView.dequeueCell(at: indexPath)
        
        return cell
    }
    
    func repoInfoCell(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell: RepoInfoCell = tableView.dequeueCell(at: indexPath)
        
        cell.tapButton = { [weak self] _ in
            
            self?.selectedIndex = indexPath
            self?.isTappedButton.toggle()
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        
        return cell
    }
}
