//
//  UIView+Extension.swift
//  SplootIOS
//
//  Created by Sahib Hussain on 18/05/23.
//

import UIKit

public extension UIView {
    
    func dropShadow(color: UIColor = .black, opacity: Float = 0.3, offSet: CGSize = .init(width: 0, height: 0), radius: CGFloat = 3) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }
    
}
