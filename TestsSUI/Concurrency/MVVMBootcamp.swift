//
//  MVVMBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 17.12.2023.
//

import SwiftUI

final class MymanagerClass {
    
    func getData() async throws -> String {
        "Some Data!"
    }
    
}

actor MyManagerActors {
    
    func getData() async throws -> String {
        "Some Data!"
    }
    
}

@MainActor class MVVMBootcampViewModel: ObservableObject {
    
    let managerClass = MymanagerClass()
    let managerActor = MyManagerActors()
    
    @Published private(set) var myData: String = "Starting text"
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach { $0.cancel() }
        tasks = []
        
    }
    
     func oncallToActionButton() {
       let task = Task {
           do {
               myData = try await managerClass.getData()
           } catch {
               print(error.localizedDescription)
           }
        }
        tasks.append(task)
    }
    
}

struct MVVMBootcamp: View {
    @StateObject private var vm = MVVMBootcampViewModel()
    var body: some View {
        
        Button(vm.myData) {
            vm.oncallToActionButton()
        }
        
    }
}

#Preview {
    MVVMBootcamp()
}
