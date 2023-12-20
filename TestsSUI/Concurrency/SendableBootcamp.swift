//
//  SendableBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 17.12.2023.
//

import SwiftUI

actor CurrentUserModel {
    
    func updateDatabase(userInfo: MyClassInfo) {
        
    }
}

struct MyInfo: Sendable{
    let name: String
}

final class MyClassInfo: @unchecked Sendable {
    private var name: String
    let queue = DispatchQueue(label: "com.MyApp.MyClassInfo")
    
    init(name: String) {
        self.name = name
    }
    
    func updateName(name: String) {
        queue.async {
            self.name = name
        }
    }
    
}

class SendableBootcampViewModel: ObservableObject {
    
    let manager = CurrentUserModel()
    
    func updateCurrentUserModelInfo() async {
        let info = MyClassInfo(name: "info")
        await manager.updateDatabase(userInfo: info)
    }
    
}

struct SendableBootcamp: View {
    
    @StateObject private var vm = SendableBootcampViewModel()
    
    var body: some View {
        Text("Hello, World!")
            .task {
                
            }
    }
}

#Preview {
    SendableBootcamp()
}
