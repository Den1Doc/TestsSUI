//
//  Text.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        
        VStack {
            Text("Hello, World!")
                .textSelection(.disabled)
//                .textSelection(.enabled)
//                .textSelection(.allowsSelection)
                .padding()
            
            
            Text(Date().addingTimeInterval(60), style: .offset)
            Text(Date().addingTimeInterval(60), style: .time)
            Text(Date().addingTimeInterval(60), style: .date)
            Text(Date().addingTimeInterval(60), style: .relative)
            Text(Date().addingTimeInterval(60), style: .timer)

            
            
        }
    }
}

struct Text_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
