//
//  TextEditorView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

#if canImport(UIKit)
extension View {
    func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

import SwiftUI

struct TextEditorView: View {
    @State private var text: String = ""
    var body: some View {
        
        VStack {
            HStack {
                Text("Enter comments here")
                Spacer()
                Button {
                    self.hideKeyBoard()
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                }

            }
            TextEditor(text: $text)
                .font(.title2)
                .border(Color.secondary.opacity(0.5), width: 1)
        }
        .padding()
        
        
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
