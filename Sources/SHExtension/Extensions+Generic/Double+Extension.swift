//
//  Double+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 22/03/22.
//

import Foundation

extension Double {
    
    public var epochToDateConverter: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd h:mm a"
        let formattedDate = Date(milliseconds: Int64(self))
        return dateFormatter.string(from: formattedDate)
    }
    
    public func epochToDate(formatter: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        let formattedDate = Date(milliseconds: Int64(self))
        return dateFormatter.string(from: formattedDate)
    }
    
    public var calculateDistance: String {
        let kms = self/1000
        let distanceArr = "\(kms)".components(separatedBy: ".")
        let kmString = distanceArr.first ?? "00"
        let mString = distanceArr.safeItem(at: 1)?.prefix(2) ?? "00"
        return "\(kmString):\(mString)"
    }
    
    public var calculateTime: String {
        let temp: Int = Int(self)
        let min: Int = temp / 60
        let sec: Int = temp % 60
        return "\(min):\(sec)"
    }
    
    public var roundUp: String {
        String(format: "%.1f", self)
    }
    
}
