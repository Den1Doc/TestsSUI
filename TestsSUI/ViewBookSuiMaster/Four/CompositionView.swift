//
//  CompositionView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct CompositionView: View {
    @State private var name = ""
    var body: some View {
        
        VStack(spacing: 30.0) {
            
            TextField("Name", text: $name)
                .padding().background(.yellow).cornerRadius(15)
                .shadow(radius: 5)
            
            TextField("Adress", text: $name)
                .padding().background(.yellow).cornerRadius(15)
                .shadow(radius: 5)
            
            Button {
                
            } label: {
                HStack {
                    Text("Next")
                    Image(systemName: "chevron.right")
                        .padding()
                }
                .padding(.horizontal).foregroundColor(.white)
                .background(.blue).cornerRadius(15)
                .shadow(radius: 5)
            }
        }
        .compositingGroup()
        .padding(20)
        .background(Color.green.opacity(0.9).cornerRadius(20))
        .shadow(radius: 5)
        .padding(20)
        
        
    }
}

struct CompositionView_Previews: PreviewProvider {
    static var previews: some View {
        CompositionView()
    }
}
