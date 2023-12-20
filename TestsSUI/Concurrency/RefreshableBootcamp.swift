//
//  RefreshableBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 17.12.2023.
//

import SwiftUI


final class RefreshableDataService {
    
    func getData() async throws -> [String] {
        ["apple", "banana", "two"].shuffled()
    }
    
}

@MainActor class RefreshableBootcampViewModel: ObservableObject {
 
    @Published private(set) var items: [String] = []
    let manager = RefreshableDataService()
    
    func loadData() async {
        Task {
            do {
                items = try await manager.getData()
            } catch {
                print(error)
            }
        }
    }
}

struct RefreshableBootcamp: View {
    
    @StateObject private var vm = RefreshableBootcampViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.items, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                }
            }
        }
        .refreshable {
          await vm.loadData()
        }
        .task {
           await vm.loadData()
        }
    }
}

#Preview {
    RefreshableBootcamp()
}
