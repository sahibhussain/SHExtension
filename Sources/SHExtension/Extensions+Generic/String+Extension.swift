//
//  String+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 16/03/22.
//

import UIKit

public extension String {
    
    var isValidEmail: Bool {
        return self.matches("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }
    
    var isValidNumber: Bool {
        var tempNumber = self
        if tempNumber.hasPrefix("+91") { tempNumber = String(tempNumber.dropFirst(3)) }
        return tempNumber.matches("[0-9]{10}")
    }
    
    var isValidURL: Bool {
        guard let url = URL(string: self) else {return false}
        return UIApplication.shared.canOpenURL(url)
    }
    
    var firstURL: URL? {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector?.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
        return matches?.first?.url
    }
    
    var encodeUrl: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
    
    
    static func randomString(_ length: Int = 12) -> String {
        return NanoID.new(length)
    }
    
    
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    func replaceStringMatching(_ regex: String, to replaceString: String) -> String {
        if let regex = try? NSRegularExpression(pattern: regex, options: NSRegularExpression.Options.caseInsensitive) {
            let range = NSMakeRange(0, self.count)
            let modString = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceString)
            return modString
        }
        return self
    }
    
    func safeText(_ moderationArray: [String]) -> String {
        var localString = self
        for str in moderationArray {
            localString = localString.replacingOccurrences(of: str, with: "***", options: .caseInsensitive)
        }
        return localString
    }
    
    func formatDate(inputFormat: PopularDateFormat, outputFormat: PopularDateFormat) ->  String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat.output
        if let date = dateFormatter.date(from: self){
            dateFormatter.dateFormat = outputFormat.output
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
}
