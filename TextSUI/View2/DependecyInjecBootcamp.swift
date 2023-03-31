//
//  DependecyInjecBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 31.03.2023.
//

import SwiftUI
import Combine

struct PostsModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

protocol DataServiceProtocol {
  func getData() -> AnyPublisher<[PostsModel], Error>
}

class ProductDataService: DataServiceProtocol {
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class MockDataService: DataServiceProtocol {
    
    let testData: [PostsModel]
    
    init(data: [PostsModel]?) {
        self.testData = data ?? [
            PostsModel(userId: 1, id: 1, title: "One", body: "one"),
            PostsModel(userId: 2, id: 2, title: "Two", body: "two")
        ]
    }
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        Just(testData)
            .tryMap({$0})
            .eraseToAnyPublisher()
    }
    
    
}

class DependecyInjecViewModel: ObservableObject {
    
    @Published var dataArray: [PostsModel] = []
    var cancel = Set<AnyCancellable>()
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol){
        self.dataService = dataService
        loadPosts()
    }
    private func loadPosts() {
            dataService.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] returnPosts in
                self?.dataArray = returnPosts
            }
            .store(in: &cancel)
    }
}

struct DependecyInjecBootcamp: View {
    
    @StateObject private var vm: DependecyInjecViewModel
    init(dataService: DataServiceProtocol){
        _vm = StateObject(wrappedValue: DependecyInjecViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            VStack{
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

struct DependecyInjecBootcamp_Previews: PreviewProvider {
    static let dataService = MockDataService(data: nil)
    static var previews: some View {
        DependecyInjecBootcamp(dataService: dataService)
    }
}
