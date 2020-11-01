//
//  SearchGitViewController.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 01.11.2020.
//

import UIKit

class SearchGitViewController: UIViewController {
    
    private let searchGitView = SearchGitView()
    
    // MARK: Life Cycle
    
    override func loadView() {
        super.loadView()
        
        view = searchGitView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

