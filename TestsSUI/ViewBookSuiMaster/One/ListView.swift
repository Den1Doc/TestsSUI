//
//  ListView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        
        
            
            List {
                ForEach(0..<3) { item in
                    Text("Item \(item)")
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                
                            } label: {
                                Image(systemName: "xmark")
                            }
                            .tint(.purple)
                            
                        }
                }
            }
            
            List {
                ForEach(0..<6) { item in
                    Text("Item \(item)")
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                
                            } label: {
                                Image(systemName: "xmark")
                            }
                            .tint(.purple)
                            Button {
                                
                            } label: {
                                Image(systemName: "flag")
                            }
                            .tint(.red)
                        }
                        
                }
            }
            
            
        
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
