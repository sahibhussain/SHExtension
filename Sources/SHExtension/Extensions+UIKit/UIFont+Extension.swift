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
    
    static func printAllFonts() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
}
