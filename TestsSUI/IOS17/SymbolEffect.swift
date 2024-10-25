//
//  SymbolEffect.swift
//  TestsSUI
//
//  Created by Денис Мишин on 22.10.2024.
//

import SwiftUI

struct SymbolEffect: View {
    @State private var isFavorite = false
    var body: some View {
        Button(action: { isFavorite.toggle() }) {
            Label("", systemImage: "mail.stack")
        }
        .symbolEffect(.bounce.down, value: isFavorite)
        .font(.largeTitle)
        
//        Button(action: { isFavorite.toggle() }) {
//                   Label("Activate Inbox Zero", systemImage: "mail.stack")
//               }
//               .symbolEffect(.bounce, options: .speed(3).repeat(3), value: isFavorite)
//               .font(.largeTitle)
        
        
//        VStack {
//                   Button {
//                       withAnimation {
//                           isFavorite.toggle()
//                       }
//                   } label: {
//                       Label("", systemImage: isFavorite ? "checkmark": "heart")
//                   }
//                   .contentTransition(.symbolEffect(.replace))
//               }
//               .font(.largeTitle)
        
    }
}

