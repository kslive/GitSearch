//
//  BaseNavigationController.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 02.11.2020.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func loadView() {
        super.loadView()
        
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
    
    func configureTextTitleNavigationController(title: String, for controller: UIViewController) {
        
        controller.title = title
    }
    
    func configureBackButton(for controller: UIViewController, action: Selector) {
        
        let backButton = UIBarButtonItem(image: UIImage(named: "Vector"), style: .plain, target: controller, action: action)
        
        backButton.tintColor = .black
        controller.navigationItem.leftBarButtonItem  = backButton
    }
}
