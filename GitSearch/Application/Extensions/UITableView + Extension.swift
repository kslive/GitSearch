//
//  UITableView + Extension.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 06.11.2020.
//

import UIKit

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(at indexPath: IndexPath, doError: Bool = false) -> T {
        let id = String(describing: T.self)
        let temp = self.dequeueReusableCell(withIdentifier: id, for: indexPath) as? T
        guard let cell = temp else {
            if doError { fatalError("Can't dequeue cell") }
            return T()
        }
        return cell
    }
}
