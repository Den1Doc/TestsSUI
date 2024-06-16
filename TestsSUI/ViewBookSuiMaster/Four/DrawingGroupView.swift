//
//  DrawingGroupView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct DrawingGroupView: View {
    @State private var  scaling: Bool = false
    var body: some View {
        
        ZStack {
            
            Button("Action") {
                self.scaling = true
            }
            
            GeometryReader { gr in
                ZStack {
                    ForEach(0...200, id: \.self) { _ in
                        Circle()
                            .foregroundColor(.green)
                            .opacity(0.2)
                            .animation(Animation.interactiveSpring(response: 0.5, dampingFraction: 0.5)
                                .repeatForever()
                                .speed(.random(in: 0.05...0.09))
                                .delay(.random(in: 0...2)))
                            .scaleEffect(self.scaling ? .random(in: 0.1...2) : 1)
                            .frame(width: .random(in: 10...100), height: .random(in: 10...100))
                            .position(x: randomCoordinate(max: gr.size.width),
                                      y: randomCoordinate(max: gr.size.height))
                    }
                }
                .drawingGroup()
            }
        }
    }
}

func randomCoordinate(max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...max)
}


struct DrawingGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingGroupView()
    }
}
