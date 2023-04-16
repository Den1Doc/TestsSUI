//
//  RotationGestureBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 30.03.2023.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .padding(50)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(.zero)
            .gesture(
                RotationGesture()
                    .onChanged{ value in
                    angle = value
                    }
                    .onEnded{ value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                        
                    }
            )
    }
}

struct RotationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureBootcamp()
    }
}
