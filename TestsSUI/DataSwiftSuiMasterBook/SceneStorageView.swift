//
//  SceneStorageView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 20.04.2023.
//

import SwiftUI

struct SceneStorageView: View {
    @SceneStorage("text") private var text = ""
    var body: some View {
        
        TextField("Hello", text: $text)
            .padding()
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.red.cornerRadius(10))
            .padding()
        
    }
}

struct SceneStorageView_Previews: PreviewProvider {
    static var previews: some View {
        SceneStorageView()
    }
}
