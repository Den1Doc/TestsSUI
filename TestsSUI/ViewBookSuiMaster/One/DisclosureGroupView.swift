//
//  DisclosureGroupView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct DisclosureGroupView: View {
    @State private var disclosureEx: Bool = true
    var body: some View {
        
        VStack {
            DisclosureGroup("More Info") {
                Text("Привет мои Друзья! На канале сегодня аж 9 подпичиков! Благодарю Вас за подписку!")
                    .font(.title2)
                    .padding()
            }
            .accentColor(.green)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(.orange).opacity(0.3))
        }
        .padding()
        
        
    }
}

struct DisclosureGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupView()
    }
}
