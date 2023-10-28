//
//  AsyncLetBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 28.10.2023.
//

import SwiftUI

struct AsyncLetBootcamp: View {
    
    @State private var image = [UIImage]()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let url = URL(string: "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0")!
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(image, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Async let")
            .onAppear {
                Task {
                    do {
                        async let fetchImage1 = fetchImage()
                        async let fetchImage2 = fetchImage()
                        async let fetchImage3 = fetchImage()
                        async let fetchImage4 = fetchImage()
                        
                        let (image1, image2, image3, image4) = await (try fetchImage1, try fetchImage2, try fetchImage3, try fetchImage4)
                        self.image.append(contentsOf: [image1, image2, image3, image4])
                        
//                        let image = try await fetchImage()
//                        self.image.append(image)
//                        
//                        let image2 = try await fetchImage()
//                        self.image.append(image2)
//                        
//                        let image3 = try await fetchImage()
//                        self.image.append(image3)
//                        
//                        let image4 = try await fetchImage()
//                        self.image.append(image4)
                        
                    } catch {
                        
                    }
                }
            }
        }
    }
    func fetchImage() async throws -> UIImage {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch {
            throw error
        }
    }
}

#Preview {
    AsyncLetBootcamp()
}
