//
//  CanvasView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct CanvasView: View {
    var body: some View {
    
        VStack {
            Canvas { context, size in
                context.stroke(
                    Path(ellipseIn: CGRect(origin: CGPoint(x: 4, y: 4),
                                           size: CGSize(width: size.width - 8,
                                                        height: size.height - 8))),
                    with: .color(.yellow),
                    lineWidth: 4)
                
                let image = Image(systemName: "scribble.variable")
                context.draw(image, at: CGPoint(x: size.width/2, y: size.height/2))
            }
            .padding()
        }
        .padding()
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
