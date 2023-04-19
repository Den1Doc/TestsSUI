//
//  FormView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 19.04.2023.
//

import SwiftUI

struct FormView: View {
    @State private var isOn: Bool = false
    var body: some View {
        
        //        Form {
        //            Section {
        //                Text("Hello")
        //                    .font(.headline)
        //                Text("U")
        //                Text("Hel")
        //                Text("H")
        //            }
        //        }
        
//        Form{
//            Section("Section") {
//                Text("Hello")
//                    .font(.headline)
//                Text("U")
//                Text("Hel")
//                Text("H")
//            }
//        }
        
        
//        Form {
//            Section(header: Text("dcd"), footer: Text("29382").bold()) {
//                Text("GHbd")
//                    .listRowBackground(Color.purple)
//            }
//        }
        
        Form {
            Section {
                Toggle(isOn: $isOn) {
                    Text("d")
                }
                Stepper(onIncrement: {}, onDecrement: {}) {
                    Text("Stepper")
                }
                
                
            }
        }
        
        
        
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
