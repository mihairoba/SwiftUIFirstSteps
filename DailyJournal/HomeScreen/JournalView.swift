//
//  JournalView.swift
//  DailyJournal
//
//  Created by Mihai Roba on 05.03.2024.
//


import PhotosUI
import SwiftUI

// View
struct JournalView: View {
    @ObservedObject var viewModel = JournalViewModel()
    
    var body: some View {
        NavigationView {
            HomeHeaderView(viewModel: viewModel)
            
            List {
                ForEach(viewModel.sectionNames(), id: \.self) { section in
                  Section(header: Text(section)) {
                    ForEach(viewModel.sections[section] ?? []) { entry in
                        NavigationLink(value: entry) {
                            EntryView(viewModel: EntryViewViewModel(entry: entry))
                        }
                    }
                  }
                }
            }
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(viewModel: JournalViewModel())
    }
}
