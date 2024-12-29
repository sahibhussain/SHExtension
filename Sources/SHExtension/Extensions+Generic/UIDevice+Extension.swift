//
//  UIDevice+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 16/03/22.
//

import Foundation
import UIKit

public extension UIDevice {
   
   // This extention deals with the devices which you want to check the specific conditions and Do the UI Changes according with device size.
   
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            
            // MARK: - iPod Touch Models
            case "iPod5,1": return "iPod touch (5th generation)"
            case "iPod7,1": return "iPod touch (6th generation)"
            case "iPod9,1": return "iPod touch (7th generation)"
            
            // MARK: - iPhone Models
            case "iPhone3,1", "iPhone3,2", "iPhone3,3": return "iPhone 4"
            case "iPhone4,1": return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2": return "iPhone 5"
            case "iPhone5,3", "iPhone5,4": return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2": return "iPhone 5s"
            case "iPhone7,2": return "iPhone 6"
            case "iPhone7,1": return "iPhone 6 Plus"
            case "iPhone8,1": return "iPhone 6s"
            case "iPhone8,2": return "iPhone 6s Plus"
            case "iPhone8,4": return "iPhone SE"
            case "iPhone9,1", "iPhone9,3": return "iPhone 7"
            case "iPhone9,2", "iPhone9,4": return "iPhone 7 Plus"
            case "iPhone10,1", "iPhone10,4": return "iPhone 8"
            case "iPhone10,2", "iPhone10,5": return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6": return "iPhone X"
            case "iPhone11,2": return "iPhone XS"
            case "iPhone11,4", "iPhone11,6": return "iPhone XS Max"
            case "iPhone11,8": return "iPhone XR"
            case "iPhone12,1": return "iPhone 11"
            case "iPhone12,3": return "iPhone 11 Pro"
            case "iPhone12,5": return "iPhone 11 Pro Max"
            case "iPhone12,8": return "iPhone SE (2nd generation)"
            case "iPhone13,1": return "iPhone 12 mini"
            case "iPhone13,2": return "iPhone 12"
            case "iPhone13,3": return "iPhone 12 Pro"
            case "iPhone13,4": return "iPhone 12 Pro Max"
            case "iPhone14,4": return "iPhone 13 mini"
            case "iPhone14,5": return "iPhone 13"
            case "iPhone14,2": return "iPhone 13 Pro"
            case "iPhone14,3": return "iPhone 13 Pro Max"
            case "iPhone14,6": return "iPhone SE (3rd generation)"
            case "iPhone14,7": return "iPhone 14"
            case "iPhone14,8": return "iPhone 14 Plus"
            case "iPhone15,2": return "iPhone 14 Pro"
            case "iPhone15,3": return "iPhone 14 Pro Max"

            // MARK: - iPhone 15 Models
            case "iPhone15,4": return "iPhone 15"
            case "iPhone15,5": return "iPhone 15 Plus"
            case "iPhone16,1": return "iPhone 15 Pro"
            case "iPhone16,2": return "iPhone 15 Pro Max"

            // MARK: - iPhone 16 Models
            case "iPhone17,1": return "iPhone 16"
            case "iPhone17,2": return "iPhone 16 Plus"
            case "iPhone17,3": return "iPhone 16 Pro"
            case "iPhone17,4": return "iPhone 16 Pro Max"
            
            // MARK: - iPad Models
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3": return "iPad (3rd generation)"
            case "iPad3,4", "iPad3,5", "iPad3,6": return "iPad (4th generation)"
            case "iPad6,11", "iPad6,12": return "iPad (5th generation)"
            case "iPad7,5", "iPad7,6": return "iPad (6th generation)"
            case "iPad7,11", "iPad7,12": return "iPad (7th generation)"
            case "iPad11,6", "iPad11,7": return "iPad (8th generation)"
            case "iPad12,1", "iPad12,2": return "iPad (9th generation)"
            case "iPad13,18", "iPad13,19": return "iPad (11th generation)"
            
            // iPad Air Models
            case "iPad4,1", "iPad4,2", "iPad4,3": return "iPad Air"
            case "iPad5,3", "iPad5,4": return "iPad Air 2"
            case "iPad11,3", "iPad11,4": return "iPad Air (3rd generation)"
            case "iPad13,1", "iPad13,2": return "iPad Air (4th generation)"
            case "iPad13,16", "iPad13,17": return "iPad Air (5th generation)"
            
            // iPad Mini Models
            case "iPad2,5", "iPad2,6", "iPad2,7": return "iPad mini"
            case "iPad4,4", "iPad4,5", "iPad4,6": return "iPad mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9": return "iPad mini 3"
            case "iPad5,1", "iPad5,2": return "iPad mini 4"
            case "iPad11,1", "iPad11,2": return "iPad mini (5th generation)"
            case "iPad14,1", "iPad14,2": return "iPad mini (6th generation)"
            case "iPad15,1", "iPad15,2": return "iPad mini (7th generation)"
            
            // iPad Pro Models
            case "iPad6,3", "iPad6,4": return "iPad Pro (9.7-inch)"
            case "iPad7,3", "iPad7,4": return "iPad Pro (10.5-inch)"
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": return "iPad Pro (11-inch) (1st generation)"
            case "iPad8,9", "iPad8,10": return "iPad Pro (11-inch) (2nd generation)"
            case "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7": return "iPad Pro (11-inch) (3rd generation)"
            case "iPad14,5": return "iPad Pro (11-inch) (7th generation)"
            case "iPad14,6": return "iPad Pro (12.9-inch) (7th generation)"
            
            // MARK: - Simulator
            case "i386", "x86_64", "arm64":
                return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            
            // Default case if no match is found
            default: return identifier
            }
            #elseif os(tvOS)
            switch identifier {
                
                // MARK: - Apple TV Models
            case "AppleTV5,3":
                return "Apple TV (4th generation)" // Released in 2015, first model with tvOS
            case "AppleTV6,2":
                return "Apple TV 4K (1st generation)" // Released in 2017, supports 4K HDR content
            case "AppleTV11,1":
                return "Apple TV 4K (2nd generation)" // Released in 2021, includes A12 Bionic chip
            case "AppleTV14,1":
                return "Apple TV 4K (3rd generation)" // Released in 2022, includes A15 Bionic chip
                
                // MARK: - Simulator
            case "i386", "x86_64":
                return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))" // Handles Apple TV simulators
                
                // Default case for unknown or future Apple TV models
            default:
                return identifier
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
    
   
}
