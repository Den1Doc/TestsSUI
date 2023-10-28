//
//  ContiuationsBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 28.10.2023.
//

import SwiftUI


class ContiuationsBootcampNetworkManager {
    
    func getData(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            return data
        } catch {
            throw error
        }
    }
    
    func getData2(url: URL) async throws -> Data {
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    continuation.resume(returning: data)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }
            .resume()
        }
    }
    
    func getHearImage(completionHandler: @escaping (_ image: UIImage) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completionHandler(UIImage(systemName: "heart.fill")!)
        }
    }
    
}

class ContiuationsBootcampViewModel : ObservableObject {
    @Published var image: UIImage? = nil
    let networkManager = ContiuationsBootcampNetworkManager()
    
    func getImage() async {
        guard let url = URL(string: "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0") else { return }
        
        
        do {
            let data = try await networkManager.getData(url: url)
            if let image = UIImage(data: data) {
                await MainActor.run {
                    self.image = image
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getHeartImage() {
        networkManager.getHearImage { [weak self] image in
            self?.image = image
        }
    }
    
}

struct ContiuationsBootcamp: View {
    
    @StateObject var vm = ContiuationsBootcampViewModel()
    var body: some View {
        
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
//            await vm.getImage()
            await vm.getHeartImage()
        }
        
    }
}

#Preview {
    ContiuationsBootcamp()
}
