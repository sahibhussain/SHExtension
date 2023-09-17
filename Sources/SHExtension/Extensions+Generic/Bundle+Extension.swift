//
//  Bundle+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 16/04/22.
//

import Foundation

extension Bundle {
    
    public var releaseVersionNumber: String {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Unknown App Version"
    }
    
    public var buildVersionNumber: String {
        return object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "Unknown Bundle Version"
    }
    
}
