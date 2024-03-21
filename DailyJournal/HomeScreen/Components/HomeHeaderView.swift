//
//  HomeHeaderView.swift
//  DailyJournal
//
//  Created by Mihai Roba on 08.03.2024.
//

import SwiftUI

struct HomeHeaderView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        HStack {
            Text("Daily Gratitude")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            NavigationLink(destination: DetailsView(viewModel: DetailsViewModel(entry: nil))) {
                Image(systemName: "plus")
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
        .padding()
    }
}

