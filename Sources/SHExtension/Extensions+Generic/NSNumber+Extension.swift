//
//  NSNumber+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 23/07/22.
//

import Foundation

public extension NSNumber {
    
    func dateStringFromTimeStamp(_ outputFormat: String) -> String {
        let date = Date(milliseconds: self.int64Value)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: date)
    }
    
    var dateFromTimeStamp: Date {
        return Date(milliseconds: self.int64Value)
    }
    
    var displayValue: String {
        return self.doubleValue.roundUp
    }
    
}
