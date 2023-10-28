import SwiftUI

class AsyncAwaitViewModel: ObservableObject {
    @Published var dataArray = [String]()
    
    func addTitle1() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dataArray.append("Title1 \(Thread.current)")
        }
    }
    
    func addTitle2() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let title = "Title2 : \(Thread.current)"
            DispatchQueue.main.async {
                self.dataArray.append(title)
                
                let title3 = "Title3 : \(Thread.current)"
                self.dataArray.append(title3)
            }
        }
    }
    
    func addAuthor1() async {
        let author1 = "Author1 : \(Thread.self)"
        self.dataArray.append(author1)
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        let author2 = "Author2 : \(Thread.self)"
        await MainActor.run {
            self.dataArray.append(author2)
        }
        
    }
    
}

struct AsyncAwaitBootcamp: View {
    @StateObject var vm = AsyncAwaitViewModel()
    var body: some View {
        
        List {
            ForEach(vm.dataArray, id: \.self) { data in
                Text(data)
            }
        }
        .onAppear {
            Task {
                await vm.addAuthor1()
            }
        }
    }
}

#Preview {
    AsyncAwaitBootcamp()
}
