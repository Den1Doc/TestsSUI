//
//  GlobalActorBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 17.12.2023.
//

import SwiftUI

@globalActor final class MyFirstGlobalActor {
    static var shared = MyNewDataManager()
}

actor MyNewDataManager {

    func getDataFroomDatabase() -> [String] {
        return ["Hello", "One", "Two"]
    }
}

class GlobalActorBootcampViewModel: ObservableObject {
    
    @Published var dataArray = [String]()
    let manager = MyFirstGlobalActor.shared
    
   @MyFirstGlobalActor func getData() async {
        let data = await manager.getDataFroomDatabase()
        self.dataArray = data
    }
    
}

struct GlobalActorBootcamp: View {
    
    @StateObject private var vm = GlobalActorBootcampViewModel()
    
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
            await vm.getData()
        }
        
    }
}

#Preview {
    GlobalActorBootcamp()
}
