//
//  PhotoModelDataService.swift
//  TestsSUI
//
//  Created by Денис Мишин on 16.04.2023.
//

import Foundation
import Combine

class PhotoModelDataService {
    
    static let instance = PhotoModelDataService()
    @Published var photoModel: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    private init() {
        dowloadData()
    }
    
    func dowloadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { (comletion) in
                switch comletion {
                case .finished:
                   break
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] (returnPhotoModel) in
                self?.photoModel = returnPhotoModel
            }
            .store(in: &cancellables)
    }
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}
