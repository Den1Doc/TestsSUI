//
//  HashableBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 06.04.2023.
//

import SwiftUI


struct MyCustomModel: Hashable {
    let title: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "One"),
        MyCustomModel(title: "Two"),
        MyCustomModel(title: "Fhree"),
        MyCustomModel(title: "Four"),
        MyCustomModel(title: "Five"),
    ]
    
    var body: some View {

        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
            }
        }
        
        
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
