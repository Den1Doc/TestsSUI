//
//  DowloadingImagesViewModel.swift
//  TestsSUI
//
//  Created by Денис Мишин on 16.04.2023.
//

import SwiftUI
import Combine

class DowloadingImagesViewModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    let dataService = PhotoModelDataService.instance
    
    init(){
        addSub()
    }
    
    func addSub() {
        dataService.$photoModel
            .sink { [weak self] (returnPhotoModel) in
                self?.dataArray = returnPhotoModel
            }
            .store(in: &cancellables)
    }
    
}
