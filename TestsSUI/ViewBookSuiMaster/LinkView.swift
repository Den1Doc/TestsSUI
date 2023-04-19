//
//  LinkView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct LinkView: View {
    var body: some View {
        
        Link("Go Home", destination: URL(string: "https://www.mongodb.com/docs/realm/sdk/swift/swiftui/model-data/change-an-object-model/")!)

    }
        
        
        
        
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView()
    }
}
