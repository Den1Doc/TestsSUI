//
//  TimelineViewBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 13.10.2023.
//

import SwiftUI

struct TimelineViewBootcamp: View {
    
    @State private var startTime: Date = .now
    @State private var pauseAnimation: Bool = false
    
    var body: some View {
        
        TimelineView(.animation(minimumInterval: 1, paused: false)) { content in
            
            Text("\(content.date)")
            Text("\(content.date.timeIntervalSince1970)")
            
//            let seconds = Calendar.current.component(.second, from: content.date)
            
            let seconds = content.date.timeIntervalSince(startTime)
            
            Text("\(seconds)")
            
            Rectangle()
                .frame(
                    width: seconds < 10 ? 50 : seconds < 30 ? 200 : 400,
                    height: 100
                )
                .animation(.bouncy, value: seconds)
            
            Button(pauseAnimation ? "Play" : "Pause") {
                pauseAnimation.toggle()
            }
            
        }
        
        
    }
}

#Preview {
    TimelineViewBootcamp()
}
