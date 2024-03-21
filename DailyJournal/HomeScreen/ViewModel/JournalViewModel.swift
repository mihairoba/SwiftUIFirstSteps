//
//  JournalViewModel.swift
//  DailyJournal
//
//  Created by Mihai Roba on 08.03.2024.
//

import UIKit.UIImage
import SwiftUI
let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae sagittis odio. Donec a luctus mi. In non feugiat turpis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; In volutpat leo at nisi tempor, pretium facilisis eros fermentum. Sed velit neque, mollis vitae accumsan in, hendrerit vitae nunc. Pellentesque sed nisi libero. Nam tempus nulla a diam faucibus, quis eleifend nulla tristique. Nunc massa lorem, vestibulum quis lorem id, consequat aliquam elit. Curabitur pharetra risus dictum, ultricies eros a, rhoncus metus. Morbi laoreet imperdiet quam. Curabitur congue vitae nisl in sollicitudin. Nulla facilisi. Donec in scelerisque lacus, sit amet fringilla eros."

// ViewModel
class JournalViewModel: ObservableObject {
    @Published var entries: [Entry] = []
    @Published var sections: [String: [Entry]] = [String : [Entry]]()
    
    init() {
        entries = generateEntries()
        sections = generateSections(entries: entries)
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
    }

    private func parseTags(tagsString: String) -> [String]? {
        let tags = tagsString.components(separatedBy: " ")
        return tags.isEmpty ? nil : tags
    }
    
    func sectionNames() -> [String] {
        let sectionNames = sections.keys.sorted( by: {
            sections[$0]?.first?.date.compare(sections[$1]?.first?.date ?? Date()) == .orderedDescending
        })
        print("----------------------")
        print(sectionNames)
        return sectionNames
    }
}


private func generateEntries() -> [Entry] {
    var newEntries = [Entry]()
    for _ in 1...30 {
        var entry = Entry()
        entry.photos = generateImages()
        entry.summary =  generateSumary()
        entry.tags = generateTags()
        newEntries.append(entry)
    }
   return newEntries
}

private func generateSections(entries: [Entry]) -> [String: [Entry]] {
    var sections: [String: [Entry]] = [String : [Entry]]()
    entries.forEach { entry in
        var sectionName: String
        if entry.date.isInCurrentWeek() {
            sectionName = "This week"
        } else if entry.date.isInCurrentMonth() {
            sectionName = "Last Month"
        } else {
            sectionName = entry.date.month()
        }
        if sections[sectionName] == nil {
            sections[sectionName] = [Entry]()
            sections[sectionName]?.append(entry)
        } else {
            sections[sectionName]?.append(entry)
        }
    }
    return sections
}

 
