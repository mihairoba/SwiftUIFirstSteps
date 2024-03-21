//
//  EntryViewViewModel.swift
//  DailyJournal
//
//  Created by Mihai Roba on 08.03.2024.
//

import Foundation

class EntryViewViewModel: ObservableObject {
    let entry: Entry
 
    init(entry: Entry) {
        self.entry = entry
    }
}
