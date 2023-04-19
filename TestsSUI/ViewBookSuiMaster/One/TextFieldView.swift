//
//  TextFieldView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct TextFieldView: View {
    @State private var textFieldData = ""
    var body: some View {
        
//        HStack {
//            Image(systemName: "envelope")
//                TextField("email addres", text: $textFieldData)
//        }
//        .padding()
//        .overlay {
//            RoundedRectangle(cornerRadius: 8)
//                .stroke(Color.green, lineWidth: 1)
//        }
//        .padding()
        
        TextField("dd", text: $textFieldData)
            .textFieldStyle(.roundedBorder)
        
        
//        TextField("enter phone", text: $textFieldData)
//            .padding()
//            .keyboardType(.default)
//            .keyboardType(.asciiCapable)
//            .keyboardType(.asciiCapableNumberPad)
//            .keyboardType(.alphabet)
//            .keyboardType(.decimalPad)
//            .keyboardType(.emailAddress)
//            .keyboardType(.namePhonePad)

        
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
