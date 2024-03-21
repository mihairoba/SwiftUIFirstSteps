//
//  Date+Extensions.swift
//  DailyJournal
//
//  Created by Mihai Roba on 08.03.2024.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
    
    func month() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: self)
    }
    
    func isInCurrentWeek() -> Bool {
        let calendar = Calendar.current
        let today = Date()
        
        let todayComponents = calendar.dateComponents([.year, .weekOfYear], from: today)
        let dateToCheckComponents = calendar.dateComponents([.year, .weekOfYear], from: self)
        
        return todayComponents.year == dateToCheckComponents.year && todayComponents.weekOfYear == dateToCheckComponents.weekOfYear
    }
    
    func isInCurrentMonth() -> Bool {
        let calendar = Calendar.current
        let today = Date()
        
        let todayComponents = calendar.dateComponents([.year, .weekOfYear], from: today)
        let dateToCheckComponents = calendar.dateComponents([.year, .weekOfYear], from: self)
        
        return todayComponents.year == dateToCheckComponents.year && todayComponents.month == dateToCheckComponents.month
    }
}
