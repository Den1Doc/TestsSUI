//
//  ProtocolsBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 31.03.2023.
//

import SwiftUI

struct ColorOne: ColorsProlocol {
    let primate: Color = .brown
    let econdary: Color = .clear
    let colors: Color = .indigo
}

struct ColorTwo: ColorsProlocol {
    let primate: Color = .red
    let econdary: Color = .pink
    let colors: Color = .yellow
}

protocol ColorsProlocol {
    var primate: Color { get }
    var econdary: Color { get }
    var colors: Color { get }
}

struct ProtocolsBootcamp: View {
    
    let col: ColorsProlocol
    
    var body: some View {
        ZStack {
            col.primate.ignoresSafeArea()
            Text("Hello, World!")
                .foregroundColor(col.primate)
                .frame(width: 150, height: 55)
                .background(col.colors.cornerRadius(10))
        }
    }
}

struct ProtocolsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolsBootcamp(col: ColorTwo())
    }
}
