//
//  TypeliastBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 08.04.2023.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypeliastBootcamp: View {
    
//    @State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    @State var item2: TVModel = TVModel(title: "Hel", director: "JJ", count: 8)
    
    var body: some View {
        
        VStack {
            Text(item2.title)
            Text(item2.director)
            Text("\(item2.count)")


        }
        
    }
}

struct TypeliastBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypeliastBootcamp()
    }
}
