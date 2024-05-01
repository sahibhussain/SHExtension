//
//  Date+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 28/04/22.
//

import Foundation

extension Date {
    
    enum PopularFormat: String {
        
        case humanReadableDate = "dd/MM/yyyy"
        case databaseReadableDate = "yyyy-MM-dd"
        case humanReadableTime = "hh:mm a"
        case humanReadableTime24h = "HH:mm"
        
    }
    
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
    
    
    var dayShort: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }
    
    var dayFull: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    var monthName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    
    var getTotalDaysInMonth: Int {
        if let range = Calendar.current.range(of: .day, in: .month, for: self) {
            return range.count
        }
        return 0
    }
    
    
    // MARK: - format
    func formattedString(_ outputFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: self)
    }
    
    func formattedString(_ popularFormat: PopularFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = popularFormat.rawValue
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
    
    var timeFromNow: String {
        
        let dayHourMinuteSecond: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: self, to: Date())
        
        if let year = difference.year, year > 0 { return year > 1 ? "\(year) Years" : "\(year) Year" }
        if let month = difference.month, month > 0 { return month > 1 ? "\(month) Months" : "\(month) Month" }
        if let day = difference.day, day > 0 { return day > 1 ? "\(day) Days" : "\(day) Day" }
        if let hour = difference.hour, hour > 0 { return hour > 1 ? "\(hour) Hrs" : "1 Hr" }
        if let min = difference.minute, min > 0 { return min > 1 ? "\(min) Mins" : "1 Min"}
        return "Just now"
        
    }
    
}
