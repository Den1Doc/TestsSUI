//
//  AsyncPublisherBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 17.12.2023.
//

import SwiftUI
import Combine

class AsyncPublisherDataManager {
    
    @Published var myData: [String] = []
    
    func addData() async {
        myData.append("Apple")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Red")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Orange")
    }
    
}

class AsyncPublisherViewModel: ObservableObject {
    
   @MainActor @Published var dataArray: [String] = []
    let manager = AsyncPublisherDataManager()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSub()
    }
    
    private func addSub() {
        
        Task {
            for await value in manager.$myData.values {
                await MainActor.run {
                    self.dataArray = value
                }
            }
        }
        
//        manager.$myData
//            .receive(on: DispatchQueue.main, options: nil)
//            .sink { dataArray in
//                self.dataArray = dataArray
//            }
//            .store(in: &cancellables)
    }
    
    func start() async {
        await manager.addData()
    }
    
}

struct AsyncPublisherBootcamp: View {
    
    @StateObject private var vm = AsyncPublisherViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .task {
           await vm.start()
        }
        
    }
}

#Preview {
    AsyncPublisherBootcamp()
}
