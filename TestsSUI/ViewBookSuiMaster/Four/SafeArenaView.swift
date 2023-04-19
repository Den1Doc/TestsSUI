//
//  SafeArenaView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct SafeArenaView: View {
    @State private var text = ""
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.pink)
                .border(.yellow)
                .padding(.bottom)
                .ignoresSafeArea(SafeAreaRegions.keyboard)
            
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            
        }
        
        
        
    }
}

struct SafeArenaView_Previews: PreviewProvider {
    static var previews: some View {
        SafeArenaView()
    }
}
