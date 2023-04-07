//
//  HapticsBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 07.04.2023.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let geneartor = UINotificationFeedbackGenerator()
        geneartor.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let geneartor = UIImpactFeedbackGenerator(style: style)
        geneartor.impactOccurred()
    }
    
}

struct HapticsBootcamp: View {
    var body: some View {
        
        VStack(spacing: 20.0) {
            Button("success") {HapticManager.instance.notification(type: .success)}
            Button("warning") {HapticManager.instance.notification(type: .warning)}
            Button("error") {HapticManager.instance.notification(type: .error)}
            Divider()
            Button("soft") { HapticManager.instance.impact(style: .soft)}
            Button("light") { HapticManager.instance.impact(style: .light)}
            Button("medium") { HapticManager.instance.impact(style: .medium)}
            Button("rigid") { HapticManager.instance.impact(style: .rigid)}
            Button("heavy") { HapticManager.instance.impact(style: .heavy)}

        }
        
    }
}

struct HapticsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HapticsBootcamp()
    }
}
