import SwiftUI
import Combine

class UnitTestViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    @Published var selectedItem: String? = nil
    let dataService: NewDataServiceProlocol
    var cancellable = Set<AnyCancellable>()
    
    init(isPremium: Bool, dataService: NewDataServiceProlocol = NewMockDataService(items: nil)) {
        self.isPremium = isPremium
        self.dataService = dataService
    }
    
    func addItem(item: String) {
        guard !item.isEmpty else {return}
        self.dataArray.append(item)
    }
    
    func selectedItem(item: String) {
        if let x = dataArray.first(where: {$0 == item}) {
            selectedItem = x
        } else {
            selectedItem = nil
        }
    }
    
    func saveItem(item: String) throws {
        guard !item.isEmpty else {
            throw DataError.noData
        }
        
        if let x = dataArray.first(where: {$0 == item}) {
            print("Save item!!! \(x)")
        } else {
            throw DataError.itemNotFound
        }
        
    }
    
    enum DataError: LocalizedError {
        case noData
        case itemNotFound
    }
    
    func downloadEscaping() {
        dataService.downloadItemEscaping { [weak self] returnItems in
            self?.dataArray = returnItems
        }
    }
    
    
    func downloadWithCombine() {
        dataService.donwloadItemsCombine()
            .sink { _ in
                
            } receiveValue: { returnItems in
                self.dataArray = returnItems
            }
            .store(in: &cancellable)
        
    }
}
