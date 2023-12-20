//
//  PhotoPickerBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 20.12.2023.
//

import SwiftUI
import PhotosUI

@MainActor final class PhotoPickerViewModel: ObservableObject {
    
    @Published private(set) var selectedImage: UIImage? = nil
    @Published var image: PhotosPickerItem? = nil {
        didSet {
            setImage(from: image)
        }
    }
    
    @Published private(set) var selectedImages: [UIImage] = []
    @Published var images: [PhotosPickerItem] = [] {
        didSet {
            setImages(from: images)
        }
    }
    
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { return }
        
        Task {
//            if let data = try? await selection.loadTransferable(type: Data.self) {
//                if let uiImage = UIImage(data: data) {
//                    selectedImage = uiImage
//                    return
//                }
//            }
            
            do {
                let data = try await selection.loadTransferable(type: Data.self)
                guard let data, let uiImage = UIImage(data: data) else {
                    throw URLError(.badServerResponse)
                }
                selectedImage = uiImage
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    
    private func setImages(from selections: [PhotosPickerItem]) {
        Task {
            var images: [UIImage] = []
            for selection in selections {
                if let data = try? await selection.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        images.append(uiImage)
                    }
                }
            }
            selectedImages = images
        }
        
    }
    
    
    
}

struct PhotoPickerBootcamp: View {
    
    @StateObject private var vm = PhotoPickerViewModel()
    
    var body: some View {
        
        VStack {
            
            Text("Image")
            
            if let image = vm.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
            }
        }
        
        PhotosPicker(selection: $vm.image, matching: .images) {
            Text("Open")
                .foregroundStyle(.red)
        }
        
        if !vm.selectedImages.isEmpty {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vm.selectedImages, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                    }
                }
            }
        }
        
        PhotosPicker(selection: $vm.images, matching: .images) {
            Text("Open Two")
                .foregroundStyle(.red)
        }
        
    }
}

#Preview {
    PhotoPickerBootcamp()
}
