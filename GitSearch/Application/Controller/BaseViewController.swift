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
    
    func configureKeyBoard(selector willShow: Selector,_ willHide: Selector) {
        
        NotificationCenter.default.addObserver(self, selector: willShow, name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: willHide, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
