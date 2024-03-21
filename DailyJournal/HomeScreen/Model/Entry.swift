//
//  Entry.swift
//  DailyJournal
//
//  Created by Mihai Roba on 08.03.2024.
//
import UIKit.UIImage

// Model
struct Entry: Hashable, Identifiable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.date.compare(rhs.date) == .orderedSame
    }
    
    var id = UUID()
    var date: Date = randomDate()
    var summary: String = ""
    var photos: [UIImage] = [UIImage]()
    var tags: [String] = [String]()
}
