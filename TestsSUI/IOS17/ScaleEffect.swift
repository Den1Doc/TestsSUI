//
//  ScaleEffect.swift
//  TestsSUI
//
//  Created by Денис Мишин on 22.10.2024.
//

import SwiftUI

struct ScaleEffect: View {
    @State private var scaleUp = false
       @State private var fadeOut = false

       var body: some View {
           Button("Нажми на меня") {
               withAnimation {
                   scaleUp = true
               } completion: {
                   withAnimation {
                       fadeOut = true
                   }
               }
           }
           .scaleEffect(scaleUp ? 3 : 1)
           .opacity(fadeOut ? 0 : 1)
    }
}

