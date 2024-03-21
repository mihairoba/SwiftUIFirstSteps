//
//  DetailsViewModel.swift
//  DailyJournal
//
//  Created by Mihai Roba on 10.03.2024.
//

import Foundation
import UIKit.UIImage

class DetailsViewModel: ObservableObject {
    var editMode: Bool = false
    var editable: Bool = true
    var showCameraButton: Bool = true
    
    var entry: Entry
    
    init(entry: Entry? = nil) {
        self.entry = entry ?? Entry()
        editMode = entry == nil
        if entry == nil {
            self.entry.photos = generateImages()
            self.entry.tags = generateTags()
            self.entry.summary = generateSumary()
        }
    }
    
    func addImage(image: UIImage) {
        entry.photos.append(image)
    }
    
    func saveButtonPressed() {
        
    }
    
    func editButtonPressed() {
        editMode = !editMode
    }
    
    func deleteButtonPressed() {
        
    }
}
