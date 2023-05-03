//
//  RectangleView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 03.05.2023.
//

import SwiftUI

struct RectangleView: View {
    var body: some View {
        
//        Rectangle().fill(.blue.gradient)
        
        let colors: [Color] = [.black, .brown, .cyan, .red, .purple]
        VStack {
            ForEach(colors, id: \.self) { color in
                Rectangle().fill(color.gradient)
            }
        }
        
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}
