//
//  ImagesCarouselViewModel.swift
//  DailyJournal
//
//  Created by Mihai Roba on 12.03.2024.
//

import Foundation
import UIKit.UIImage

class ImagesCarouselViewModel: ObservableObject {
    let photos: [UIImage]
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    
    init(photos: [UIImage], itemWidth: CGFloat = 100, itemHeight: CGFloat = 100) {
        self.photos = photos
        self.itemWidth = itemWidth
        self.itemHeight = itemHeight
    }
}
