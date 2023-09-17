//
//  File.swift
//  SahibExtension
//
//
//  Created by Sahib Hussain on 17/09/23.
//

import UIKit

extension UIFont {
    
    static func fontFor(_ type: String, size: CGFloat) -> UIFont {
        return UIFont(name: type, size: size) ?? .systemFont(ofSize: 17)
    }
    
}
