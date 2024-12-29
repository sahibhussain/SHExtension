//
//  Double+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 22/03/22.
//

import Foundation

public extension Double {
    
    func epochToDate(formatter: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        let formattedDate = Date(milliseconds: Int64(self))
        return dateFormatter.string(from: formattedDate)
    }
    
    var roundUp: String { String(format: "%.1f", self) }
    var roundUp2: String { String(format: "%.2f", self) }
    
}
