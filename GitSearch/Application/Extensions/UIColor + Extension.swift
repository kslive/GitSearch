//
//  UIColor + Extension.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 07.11.2020.
//

import UIKit

extension UIColor {
    
  static func appColor(_ name: AssetsColor) -> UIColor? {
     return UIColor(named: name.rawValue)
  }
}
