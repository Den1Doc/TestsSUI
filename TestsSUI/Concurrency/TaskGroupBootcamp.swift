import SwiftUI

class TaskGroupBootcampDataManager {
    
    
    func fetchImageWithAsyncLet() async throws -> [UIImage] {
        async let fetchImage1 = fetchImage(urlStr: "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0")
        async let fetchImage2 = fetchImage(urlStr: "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0")
        async let fetchImage3 = fetchImage(urlStr: "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0")
        async let fetchImage4 = fetchImage(urlStr: "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0")
        
        let (image1, image2, image3, image4) = await (try fetchImage1, try fetchImage2, try fetchImage3, try fetchImage4)
        return [image1, image2, image3, image4]
    }
    
    
    func fetchImageTaskGroup() async throws -> [UIImage] {
        
        let urlString = [
            "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0",
            "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0",
            "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0",
            "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0"
        ]
        
        return try await withThrowingTaskGroup(of: UIImage.self) { group in
            var images = [UIImage]()
            
            for urlString in urlString {
                group.addTask {
                    try await self.fetchImage(urlStr: urlString)
                }
            }
            
            for try await image in group {
                images.append(image)
            }
            
            return images
        }
    }
    
    func fetchImage(urlStr: String) async throws -> UIImage {
        guard let url = URL(string: urlStr) else {
            throw URLError(.badURL)
        }
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

class TaskGroupBootcampViewModel : ObservableObject {
    
    @Published var images = [UIImage]()
    let manager = TaskGroupBootcampDataManager()
    
    func getImages() async {
        if let images = try? await manager.fetchImageTaskGroup() {
            self.images.append(contentsOf: images)
        }
    }
}


struct TaskGroupBootcamp: View {
    
    @StateObject var vm = TaskGroupBootcampViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(vm.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("TaskGroup")
            .task {
                await vm.getImages()
            }
        }
        
    }
}

#Preview {
    TaskGroupBootcamp()
}
