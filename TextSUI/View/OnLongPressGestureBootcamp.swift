//
//  OnLongPressGestureBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 30.03.2023.
//

import SwiftUI

struct OnLongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    
    var body: some View {
        Text(isComplete ? "Com" : "Not")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? Color.green : Color.gray)
            .cornerRadius(10)
//            .onTapGesture {
//                isComplete.toggle()
//            }
            .onLongPressGesture(minimumDuration: 0.2) {
                isComplete.toggle()
            }
        
        
    }
}

struct OnLongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnLongPressGestureBootcamp()
    }
}
