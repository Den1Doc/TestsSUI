//
//  AppStorageView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 20.04.2023.
//

import SwiftUI


private struct App: View {
    var body: some View {
     
        Text("d")
    }
}

struct AppStorageView: View {
    @AppStorage("user") var user = "Maks"
    var body: some View {
        
        NavigationView {
            VStack {
                
                Text("AppStorage: user")
                Text("\(user)")
                
                NavigationLink("Edit", destination: App())
                
            }
            .navigationTitle("AppStorage")
        }
        
    }
}

struct AppStorageView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageView()
    }
}
