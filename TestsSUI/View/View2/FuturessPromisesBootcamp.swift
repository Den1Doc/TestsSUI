//
//  FuturessPromisesBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 31.03.2023.
//

import SwiftUI
import Combine

class FuturesViewModel: ObservableObject {
    
    @Published var title: String = "Hello title"
    let url = URL(string: "http://www.goole.com")!
    var cansel = Set<AnyCancellable>()
    
    init() {
        download()
    }
    
    func download() {
//        getCombinePulisher()
        getFuturePulisher()
            .sink { _ in

            } receiveValue: { [weak self] returnvalue in
                self?.title = returnvalue
            }
            .store(in: &cansel)
        
//        getEscaping { [weak self] returnValue, error in
//            self?.title = returnValue
//        }

    }
    
    func getCombinePulisher() -> AnyPublisher<String, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({_ in return "New"})
            .timeout(1, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getEscaping(completionHandler: @escaping (_ value: String, _ error: Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completionHandler("Value 2", nil)
        }
        .resume()
    }
    
    func getFuturePulisher() -> Future<String, Error>{
         Future { promise in
            self.getEscaping { returnValue, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(returnValue))
                }
            }
        }
    }
    
    func doSome(comletion: @escaping(_ value: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            comletion("New Str")
        }
    }
    
    func doSomeTheFuture() -> Future<String, Never> {
        Future { promise in
            self.doSome { value in
                promise(.success(value))
            }
        }
    }
    
}

struct FuturessPromisesBootcamp: View {
    
    @StateObject private var vm = FuturesViewModel()
    
    var body: some View {
        Text(vm.title)
    }
}

struct FuturessPromisesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FuturessPromisesBootcamp()
    }
}
