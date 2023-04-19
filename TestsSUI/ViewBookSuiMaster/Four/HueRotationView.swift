//
//  HueRotationView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct HueRotationView: View {
    private var lightRed = Color(hue: 1, saturation: 0.5, brightness: 1)
    var body: some View {
        
        HStack {
            lightRed
                .frame(width: 50, height: 50)
                .hueRotation(.degrees(45))
            lightRed
                .frame(width: 50, height: 50)
                .hueRotation(.degrees(180))
            lightRed
                .frame(width: 50, height: 50)
                .hueRotation(.degrees(90))
            
        }
        
    }
}

struct HueRotationView_Previews: PreviewProvider {
    static var previews: some View {
        HueRotationView()
    }
}
