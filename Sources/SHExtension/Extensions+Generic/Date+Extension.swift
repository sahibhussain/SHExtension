//
//  Date+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 28/04/22.
//

import Foundation

public enum PopularDateFormat {
    
    case humanReadableDate
    case databaseReadableDate
    case humanReadableTime
    case humanReadableTime24h
    case custom(output: String)
    
    var output: String {
        switch self {
        case .humanReadableDate: return "dd/MM/yyyy"
        case .databaseReadableDate: return "yyyy-MM-dd"
        case .humanReadableTime: return "hh:mm a"
        case .humanReadableTime24h: return "HH:mm"
        case .custom(output: let output): return output
        }
    }
    
}

public extension Date {
    
    // MARK: - millisecond time
    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    var millisecondsSince1970: Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    
    // MARK: - Component
    var second: Int { Calendar.current.component(.second, from: self) }
    var minute: Int { Calendar.current.component(.minute, from: self) }
    var hour: Int { Calendar.current.component(.hour, from: self) }
    var date: Int { Calendar.current.component(.day, from: self) }
    var month: Int { Calendar.current.component(.month, from: self) }
    var year: Int { Calendar.current.component(.year, from: self) }
    
    var getTotalDaysInMonth: Int {
        if let range = Calendar.current.range(of: .day, in: .month, for: self) {
            return range.count
        }
        return 0
    }
    
    
    // MARK: - format
    func formattedString(_ popularFormat: PopularDateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = popularFormat.output
        dateFormatter.locale = .init(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }
    
    
    // MARK: generic
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    func timeFromNow(with suffix: String) -> String {
        
        let dayHourMinuteSecond: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: self, to: Date())
        
        if let year = difference.year, year > 0 { return (year > 1 ? "\(year) Years" : "\(year) Year") + suffix }
        if let month = difference.month, month > 0 { return (month > 1 ? "\(month) Months" : "\(month) Month") + suffix }
        if let day = difference.day, day > 0 { return (day > 1 ? "\(day) Days" : "\(day) Day") + suffix }
        if let hour = difference.hour, hour > 0 { return (hour > 1 ? "\(hour) Hrs" : "1 Hr") + suffix }
        if let min = difference.minute, min > 0 { return (min > 1 ? "\(min) Mins" : "1 Min") + suffix }
        return "Just now"
        
    }
    
}
