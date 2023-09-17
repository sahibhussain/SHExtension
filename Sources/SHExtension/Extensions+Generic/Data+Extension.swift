//
//  Data+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 07/06/23.
//

import Foundation

extension Data {
    
    init?(hexString: String) {
        let length = hexString.count / 2
        var data = Data(capacity: length)
        
        for i in 0..<length {
            let start = hexString.index(hexString.startIndex, offsetBy: i*2)
            let end = hexString.index(start, offsetBy: 2)
            let range = start..<end
            
            let byteString = hexString[range]
            if var byte = UInt8(byteString, radix: 16) {
                data.append(&byte, count: 1)
            } else {
                return nil
            }
        }
        
        self = data
    }
    
}
