//
//  ImagesCarouselView.swift
//  DailyJournal
//
//  Created by Mihai Roba on 12.03.2024.
//

import SwiftUI

struct ImagesCarouselView: View {
    var viewModel: ImagesCarouselViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(1..<viewModel.photos.count, id: \.self) { index in
                    Image(uiImage: viewModel.photos[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: viewModel.itemWidth, height: viewModel.itemHeight)
                        .cornerRadius(10)
                }
            }
        }
    }
}
