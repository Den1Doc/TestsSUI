//
//  ToolBarView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 26.04.2023.
//

import SwiftUI

struct ToolBarView: View {
    var body: some View {
        
        NavigationStack {
            Text("Hello, World!")
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(id: "", placement: ToolbarItemPlacement.status, showsByDefault: false) {
//                    ToolbarItem(placement: .primaryAction) {
                        ControlGroup {
                            Button {
                                
                            } label: {
                                Image(systemName: "person")
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "gear")
                            }
                        }
                    }
                }
                .controlGroupStyle(.navigation)
        }
    }
}





struct ToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarView()
    }
}
