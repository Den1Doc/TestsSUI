//
//  ContentUnavailableView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 22.10.2024.
//

import SwiftUI

struct ContentUnavailable: View {
    var body: some View {
        
        ContentUnavailableView("Привет", systemImage: "doc.text", description: Text("Привет"))
        
    }
}

#Preview {
    ContentUnavailable()
}
