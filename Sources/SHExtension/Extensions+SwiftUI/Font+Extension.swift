//
//  Font+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 29/03/22.
//

import SwiftUI

public extension Font {
    
    static func fontFor(_ type: String, size: CGFloat) -> Font {
        return Font.custom(type, size: size)
    }
    
    static func printAllFonts() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
}
