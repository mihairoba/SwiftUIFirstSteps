//
//  TagsView.swift
//  DailyJournal
//
//  Created by Mihai Roba on 12.03.2024.
//

import SwiftUI

struct TagsView: View {
    let viewModel: TagsViewViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(0..<viewModel.tags.count, id: \.self) { index in
                    ZStack {
                        Text("#"+viewModel.tags[index])
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 6)
                    }
                    .cornerRadius(3)
                    .border(.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}
