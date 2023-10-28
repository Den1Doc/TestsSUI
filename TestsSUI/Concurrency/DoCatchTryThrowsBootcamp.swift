import SwiftUI

class DoCatchTryThrowsBootcampDataManager {
    
    let isActive = false
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("New text!", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("New text")
        } else {
            return .failure(URLError(.badURL))
        }
    }
    
    func getTitle3() throws -> String {
        if isActive {
            return "New text"
        } else {
            throw URLError(.badServerResponse)
        }
        
        
    }
    
}

class DoCatchTryThrowsBootcampViewModel: ObservableObject {
    @Published var text = "Str text"
    let manager = DoCatchTryThrowsBootcampDataManager()
    
    func fetchTitle() {
        /*
         let returnedValue = manager.getTitle()
         if let newTitle = returnedValue.title {
         self.text = newTitle
         } else if let error = returnedValue.error {
         self.text = error.localizedDescription
         }
         */
        
        /*
        let result = manager.getTitle2()
        switch result {
        case.success(let newTitle):
            self.text = newTitle
        case .failure(let error):
            self.text = error.localizedDescription
        }
        */
        
        do {
            let newTitle = try manager.getTitle3()
            self.text = newTitle
        } catch {
            self.text = error.localizedDescription
        }
    }
    
}

struct DoCatchTryThrowsBootcamp: View {
    
    @StateObject var vm = DoCatchTryThrowsBootcampViewModel()
    
    var body: some View {
        
        Text(vm.text)
            .frame(width: 300, height: 300)
            .background(.blue)
            .onTapGesture {
                vm.fetchTitle()
            }
    }
}

#Preview {
    DoCatchTryThrowsBootcamp()
}
