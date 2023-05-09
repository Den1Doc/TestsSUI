import SwiftUI
import Combine

protocol NewDataServiceProlocol {
    func downloadItemEscaping(complited: @escaping (_ itemss: [String]) -> ())
    func donwloadItemsCombine() -> AnyPublisher<[String], Error>
}

class NewMockDataService: NewDataServiceProlocol {
    
    let items: [String]
    
    init(items: [String]?) {
        self.items = items ?? ["One", "Two", "Three"]
    }
    
    func downloadItemEscaping(complited: @escaping (_ itemss: [String]) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            complited(self.items)
        }
    }
    
    func donwloadItemsCombine() -> AnyPublisher<[String], Error> {
        Just(items)
            .tryMap({ publishedItems in
                guard !publishedItems.isEmpty else {
                    throw URLError(.badServerResponse)
                }
                return publishedItems
            })
            .eraseToAnyPublisher()
    }
    
}
