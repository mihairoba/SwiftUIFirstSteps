//
//  DetailsView.swift
//  DailyJournal
//
//  Created by Mihai Roba on 10.03.2024.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewModel: DetailsViewModel
    
    var body: some View {
        VStack(spacing: 10){
            DetailsHeaderView(viewModel: viewModel)
            
            Text(viewModel.entry.date.formattedDate())
                .font(.body)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Message", text: $viewModel.entry.summary, axis: .vertical)
                .lineLimit(1...3)
                .padding(.bottom, 10)
            if let photo = viewModel.entry.photos.first {
                Image(uiImage: photo)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .cornerRadius(50)
                    .background(.red)
                    .clipped()
            }
            if viewModel.entry.photos.count > 1 {
                ImagesCarouselView(viewModel: ImagesCarouselViewModel(photos: viewModel.entry.photos,
                                                                      itemWidth: 70,
                                                                      itemHeight: 70))
            }
            if viewModel.entry.tags.count > 0 {
                TagsView(viewModel: TagsViewViewModel(tags: viewModel.entry.tags))
            }
            Spacer()
            
            Button(action: {
                viewModel.saveButtonPressed()
            }) {
                Text("Save")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40)
                    .background(.green)
                    .cornerRadius(10)
            }
            .opacity(viewModel.editMode ? 1 : 0)
            .disabled(!viewModel.editable)

            Spacer()
        }
        .padding(.horizontal, 15)
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarHidden(true)
    }
}

#Preview {
    DetailsView(viewModel: DetailsViewModel(entry: nil))
}
