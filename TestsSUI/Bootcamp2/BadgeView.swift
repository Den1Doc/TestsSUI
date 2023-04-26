//
//  BadgeView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 26.04.2023.
//

import SwiftUI

struct BadgeView: View {
    @State private var heartbadgeSeen = false
    var body: some View {
        
        TabView {
            Color.red
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .badge("10")
            
            Color.green
                .onAppear { heartbadgeSeen = true }
                .tabItem {
                    Image(systemName: "suit.heart.fill")
                }
                .badge(heartbadgeSeen ? 0 : 20)
            
            Color.yellow
                .tabItem {
                    Image(systemName: "gearshape")
                }

        }
        
        
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
