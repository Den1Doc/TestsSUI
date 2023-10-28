import SwiftUI

class TaskBootcampViewModel: ObservableObject {
    @Published var image : UIImage? = nil
    @Published var image2 : UIImage? = nil

    
    func fetchImage() async {
        do {
            guard let url = URL(string: "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            await MainActor.run {
                self.image = UIImage(data: data)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage2() async {
        do {
            guard let url = URL(string: "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            await MainActor.run {
                self.image2 = UIImage(data: data)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

struct TaskBootcampHomeView: View {
    var body: some View {
     
        NavigationStack {
            ZStack {
                NavigationLink("Привет") {
                    TaskBootcamp()
                }
            }
        }
        
        
    }
}


struct TaskBootcamp: View {
    @StateObject var vm = TaskBootcampViewModel()
    var body: some View {
        
        VStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            if let image = vm.image2 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
            await vm.fetchImage()

        }
//        .onAppear {
//            Task {
//                await vm.fetchImage()
//            }
//            //            Task {
//            //                print(Thread.current)
//            //                print(Task.currentPriority)
//            //                await vm.fetchImage2()
//            //            }
//            
////            Task(priority: .low) {
////                print("Low: \(Thread.current) : \(Task.currentPriority)")
////            }
////            Task(priority: .medium) {
////                print("medium: \(Thread.current) : \(Task.currentPriority)")
////            }
////            Task(priority: .high) {
////                print("high: \(Thread.current) : \(Task.currentPriority)")
////            }
////            Task(priority: .background) {
////                print("background: \(Thread.current) : \(Task.currentPriority)")
////            }
////            Task(priority: .utility) {
////                print("utility: \(Thread.current) : \(Task.currentPriority)")
////            }
////            Task(priority: .userInitiated) {
////                print("userInitiated: \(Thread.current) : \(Task.currentPriority)")
////            }
//            
//        }
        
        
    }
}

#Preview {
    TaskBootcamp()
}
