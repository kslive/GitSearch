//
//  BaseViewController.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 02.11.2020.
//

import UIKit

class BaseViewController: UIViewController {

    let baseView = BaseView()
    
    private let baseNavigationController = BaseNavigationController()
        
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        
        view = baseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
    }
    
    // MARK: - Help Functions
    
    func setupNavigationController(title: String? = nil, action: Selector? = nil) {
        
        guard let title = title else { return }
        
        baseNavigationController.configureTextTitleNavigationController(title: title, for: self)
        
        guard let action = action else { return }
        
        baseNavigationController.configureBackButton(for: self, action: action)
    }
}
