//
//  StrongSelfBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 17.12.2023.
//

import SwiftUI

final class StrongSelfService {
    
    func getData() async -> String {
        "Update data!"
    }
    
}

final class StrongSelfBootcampViewModel: ObservableObject {
    
    @Published var data: String = "Title"
    let dataService = StrongSelfService()
    
    func updateData() {
        Task {
            data = await dataService.getData()
        }
    }
    
    func updateData2() {
        Task {
            self.data = await dataService.getData()
        }
    }
    
    func updateData3() {
        Task { [self] in
            self.data = await dataService.getData()
        }
    }
    
    func updateData4() {
        Task { [weak self] in
            if let data = await self?.dataService.getData() {
                self?.data = data
            }
        }
    }
    
}

struct StrongSelfBootcamp: View {
    @StateObject var vm = StrongSelfBootcampViewModel()
    var body: some View {
        Text(vm.data)
            .onAppear {
                vm.updateData2()
            }
    }
}

#Preview {
    StrongSelfBootcamp()
}
