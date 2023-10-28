//
//  AccessibilityColorsBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 13.10.2023.
//

import SwiftUI

struct AccessibilityColorsBootcamp: View {
    var body: some View {
        
        Button("Button 1") {
            print("Button 1")
        }
        .foregroundStyle(.primary)
        .buttonStyle(.borderedProminent)
        
        Button("Button 2") {
            print("Button 2")
        }
        .foregroundStyle(.primary)
        .buttonStyle(.borderedProminent)
        .tint(.orange)
        
        Button("Button 3") {
            print("Button 3")
        }
        .foregroundStyle(.white)
        .foregroundStyle(.primary)
        .buttonStyle(.borderedProminent)
        .tint(.green)
        
        Button("Button 4") {
            print("Button 4")
        }
        .foregroundStyle(.green)
        .foregroundStyle(.primary)
        .buttonStyle(.borderedProminent)
        .tint(.purple)
    }
}

#Preview {
    AccessibilityColorsBootcamp()
}
