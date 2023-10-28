import SwiftUI

class DownloandImageAsyncLoader {
    
    let url = URL(string: "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0")!
    
    func downloadWithEscaping(completionHandler: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                let image = UIImage(data: data),
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    return
            }
            completionHandler(image, nil)
        }
        .resume()
    }
}

class DownloandImageAsyncViewModel: ObservableObject {

    @Published var image : UIImage? = nil
    let loader = DownloandImageAsyncLoader()
    
    func fetchImage() {
        loader.downloadWithEscaping { [weak self] image, error in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
    
    
}
struct DownloandImageAsyncBootcamp: View {
    @StateObject private var vm = DownloandImageAsyncViewModel()
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
        }
        .onAppear {
            vm.fetchImage()
        }
    }
}

#Preview {
    DownloandImageAsyncBootcamp()
}
