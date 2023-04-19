//
//  LabelView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        
        List {
            Label("Jgue",systemImage: "doc")
            Label("Jgue",systemImage: "camera")
            Label("Jgue",systemImage: "photo")
//                .border(Color.purple, width: 3)
                .listItemTint(.red)
        }
        
        
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView()
    }
}
