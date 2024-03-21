//
//  EntryView.swift
//  DailyJournal
//
//  Created by Mihai Roba on 08.03.2024.
//

import SwiftUI

struct EntryView: View {
    let viewModel: EntryViewViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.entry.date.formattedDate())
                .font(.body)
                .foregroundColor(Color(uiColor:UIColor(red: 0.53, green: 0.53, blue: 0.53, alpha: 1.00)))
            Text(viewModel.entry.summary)
                .font(.headline)
                .foregroundColor(.black)
            
            if let photo = viewModel.entry.photos.first {
                Image(uiImage: photo)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 50)
                    .cornerRadius(5)
            }
            if viewModel.entry.tags.count > 0 {
                TagsView(viewModel: TagsViewViewModel(tags: viewModel.entry.tags))
            }
        }
        .padding(.bottom, 5)
    }
}
