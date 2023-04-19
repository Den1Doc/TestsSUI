//
//  Brightness.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct BrightnessView: View {
    var body: some View {
        
        
        HStack {
            Color.red
                .frame(width: 50, height: 50)
                .brightness(0)
            
            Color.yellow
                .frame(width: 50, height: 50)
                .brightness(0.5)
            
        }
        
        
    }
}

struct BrightnessView_Previews: PreviewProvider {
    static var previews: some View {
        BrightnessView()
    }
}
