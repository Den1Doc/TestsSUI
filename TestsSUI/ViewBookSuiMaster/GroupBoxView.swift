//
//  GroupBoxView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct GroupBoxView: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        
        GroupBox {
        Text("Login")
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
            TextField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.horizontal)
        .font(.title3)
        
    }
}

struct GroupBoxView_Previews: PreviewProvider {
    static var previews: some View {
        GroupBoxView()
    }
}
