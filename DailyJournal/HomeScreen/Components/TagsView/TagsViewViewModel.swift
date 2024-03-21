//
//  TagsViewViewModel.swift
//  DailyJournal
//
//  Created by Mihai Roba on 12.03.2024.
//

import Foundation

class TagsViewViewModel: ObservableObject {
    let tags: [String]
 
    init(tags: [String]) {
        self.tags = tags
    }
}
