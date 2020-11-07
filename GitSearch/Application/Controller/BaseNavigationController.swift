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
        
        navigationBar.barTintColor = UIColor.appColor(.background)
    }
    
    func configureTextTitleNavigationController(title: String, for controller: UIViewController) {
        
        controller.title = title
    }
    
    func configureButton(for controller: UIViewController, action: Selector, image: UIImage, isRight: Bool) {
        
        let button = UIBarButtonItem(image: image, style: .plain, target: controller, action: action)
        
        button.tintColor = UIColor.appColor(.title)
        
        switch isRight {
        case true: return controller.navigationItem.rightBarButtonItem = button
        case false: return controller.navigationItem.leftBarButtonItem = button
        }
    }
}
