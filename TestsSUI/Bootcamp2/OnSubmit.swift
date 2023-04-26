//
//  OnSubmit.swift
//  TestsSUI
//
//  Created by Денис Мишин on 26.04.2023.
//

import SwiftUI

struct OnSubmitView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("OnTrigger...")
                
                TextField("Type Here", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
            }
            .searchable(text: .constant(""))
            .navigationTitle("Search")
        }
        .onSubmit(of: [.search, .text]) {
            print("serch")
        }
        
    }
}

struct OnSubmitView_Previews: PreviewProvider {
    static var previews: some View {
        OnSubmitView()
    }
}
