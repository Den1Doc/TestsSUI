//
//  SaturationView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct SaturationView: View {
    var body: some View {
        
        VStack {
            Color.red
                .frame(width: 50, height: 50)
                .saturation(0)
            
            Color.red
                .frame(width: 50, height: 50)
                .saturation(1)
            
            Color.red
                .frame(width: 50, height: 50)
                .saturation(0.5)
                
            
        }
        
        
        
    }
}

struct SaturationView_Previews: PreviewProvider {
    static var previews: some View {
        SaturationView()
    }
}
