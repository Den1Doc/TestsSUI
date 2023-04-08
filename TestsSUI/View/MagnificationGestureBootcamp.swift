//
//  MagnificationGestureBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 30.03.2023.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State var current: CGFloat = 0
    @State var current2: CGFloat = 0

    
    var body: some View {
        Text("Hello, World!")
            .font(.title)
            .padding(40)
            .background(Color.red.cornerRadius(10))
            .scaleEffect(1 + current + current2)
            .gesture(MagnificationGesture().onEnded{ value in
                current = value - 1
            }.onEnded({ value in
                current2 += current
                current2 = 0
            }))
            
    }
}

struct MagnificationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureBootcamp()
    }
}
