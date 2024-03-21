//
//  DetailsHeaderView.swift
//  DailyJournal
//
//  Created by Mihai Roba on 10.03.2024.
//

import SwiftUI
import PhotosUI

struct DetailsHeaderView: View {
    @ObservedObject var viewModel: DetailsViewModel
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Image(systemName: "chevron.left")
                    .font(.subheadline)
                    .foregroundColor(.black)
                Text("Back")
                    .foregroundColor(.black)
                    .font(.headline.weight(.regular))
            }
            Spacer()
            Button(action: {
                viewModel.editButtonPressed()
            })
            {
                Image(systemName: "pencil")
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            .opacity((viewModel.editable && !viewModel.editMode) ? 1 : 0)
            .disabled(!viewModel.editable)
            Button(action: {
                viewModel.deleteButtonPressed()
            }) {
                Image(systemName: "trash")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .opacity((viewModel.editable && !viewModel.editMode) ? 1 : 0)
            .disabled(!viewModel.editable)
            
            Button(action: {
                showingImagePicker = true
            }) {
                Image(systemName: "camera")
                    .padding()
                    .foregroundColor(.gray)
                    .clipShape(Circle())
            }
            .opacity(viewModel.editMode ? 1 : 0)
        }
        .onChange(of: selectedImage) { _ in
            loadImage()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        } content: {
            
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        viewModel.addImage(image: selectedImage)
    }
}

#Preview {
    DetailsHeaderView(viewModel: DetailsViewModel(entry: nil))
}
