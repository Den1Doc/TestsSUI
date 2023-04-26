//
//  ToolBarView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 26.04.2023.
//

import SwiftUI

struct ToolBarView: View {
    @State private var isOn = false
    var body: some View {
        
        NavigationView {
            Text("Hello, World!")
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
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
