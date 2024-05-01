//
//  Double+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 22/03/22.
//

import Foundation

extension Double {
    
    public func epochToDate(formatter: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        let formattedDate = Date(milliseconds: Int64(self))
        return dateFormatter.string(from: formattedDate)
    }
    
    public var roundUp: String {
        String(format: "%.1f", self)
    }
    
}
