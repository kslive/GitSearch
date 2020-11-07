//
//  LineView.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 07.11.2020.
//

import UIKit

class LineView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: frame.height, y: frame.width))
        path.addLine(to: CGPoint(x: 0, y: frame.width))
        path.close()
        
        UIColor(red: 0.169, green: 0.165, blue: 0.18, alpha: 1).set()
        
        path.stroke()
    }
}
