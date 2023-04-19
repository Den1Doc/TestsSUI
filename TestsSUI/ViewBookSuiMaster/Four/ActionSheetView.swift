//
//  ActionSheetView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct ActionSheetView: View {
    @State private var present = false
    var body: some View {
        
        VStack {
            Button {
                present = true
            } label: {
                Text("df")
            }

            
        }.actionSheet(isPresented: $present) {
            ActionSheet(title: Text("rr"))
        }
        
        
        
    }
}

struct ActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetView()
    }
}
