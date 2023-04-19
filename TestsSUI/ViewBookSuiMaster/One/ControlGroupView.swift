//
//  ControlGroup.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct ControlGroupView: View {
    var body: some View {
        
        VStack {
            
            ControlGroup {
                Button("Hello"){}
                Button {} label: {
                    Image(systemName: "gearshape.fill")
                }
                
            }
            .controlGroupStyle(.automatic)
            
            
        }
        
        
        
    }
}

struct ControlGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ControlGroupView()
    }
}
