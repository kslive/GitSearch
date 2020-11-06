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
    
    func configureButton(for controller: UIViewController, action: Selector, image: UIImage, isRight: Bool) {
        
        let button = UIBarButtonItem(image: image, style: .plain, target: controller, action: action)
        
        button.tintColor = .black
        
        switch isRight {
        case true: return controller.navigationItem.rightBarButtonItem = button
        case false: return controller.navigationItem.leftBarButtonItem = button
        }
    }
}
