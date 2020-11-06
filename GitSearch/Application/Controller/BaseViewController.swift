//
//  BaseViewController.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 02.11.2020.
//

import UIKit

class BaseViewController: UIViewController {

    let baseView = BaseView()    
    let baseNavigationController = BaseNavigationController()
        
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        
        view = baseView
    }
}
