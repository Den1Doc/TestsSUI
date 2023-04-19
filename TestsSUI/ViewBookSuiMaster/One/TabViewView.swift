//
//  TabView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct TabViewView: View {
    var body: some View {
        
//        TabView {
//            VStack {
//                Text("TabView")
//                    .font(.footnote)
//            }.tabItem {
//                Text("Tab 1")
//            }
//
//            Text("dd")
//                .tabItem {
//                    Text("tab 2")
//                }
//        }
        
        TabView {
            VStack {
                Text("fvkj")
            }
            
            
            VStack {
                Text("dcd")
            }
            
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewView()
    }
}
