//
//  DataPickerView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct DatePickerView: View {
    @State private var date = Date()
    var body: some View {
        
        
        VStack {
            
            DatePicker("", selection: $date, displayedComponents: .date)
//                .background(Rectangle()
//                    .fill(.yellow).opacity(0.3))
                .background(RoundedRectangle(cornerRadius: 8, style: .circular).fill(.green))
                .labelsHidden()
//                .datePickerStyle(.graphical)
//                .datePickerStyle(.automatic)
//                .datePickerStyle(.compact)
//                .datePickerStyle(.wheel)
            
            Form {
                DatePicker("Hello", selection: $date)
                    .foregroundColor(.green)
                DatePicker("Color", selection: $date)
                    .foregroundColor(.yellow)
                DatePicker("foreColor", selection: $date)
                    .foregroundColor(.brown)
                DatePicker("titn", selection: $date)
                    .foregroundColor(.cyan)


            }
            
            
        }
        
        
        
        
        
        
        
        
        
        
    }
}

struct DataPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
