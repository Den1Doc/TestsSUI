//
//  DragGestureBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 08.04.2023.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State var offest: CGSize = .zero
    
    var body: some View {
        
        
        VStack {
            Text("\(offest.width)")
            Spacer()
            
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offest)
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offest = value.translation
                            }
                        }
                        .onEnded{ value in
                            withAnimation(.spring()) {
                                offest = .zero
                            }
                        })
            
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offest.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offest.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentageAsDouble * maxAngle
    }
    
}

struct DragGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp()
    }
}
