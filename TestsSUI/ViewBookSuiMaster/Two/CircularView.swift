//
//  CircularView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct CircularView: View {
    var body: some View {
        
        VStack(spacing: 5.0) {
            Circle()
                .padding()
            Capsule()
                .padding()
            Ellipse()
                .padding()
        }
        
        
    }
}

struct CircularView_Previews: PreviewProvider {
    static var previews: some View {
        CircularView()
    }
}
