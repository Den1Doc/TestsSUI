//
//  StateObjectView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 20.04.2023.
//

import SwiftUI

class Cars: ObservableObject {
    @Published var year: String = ""
    @Published var make: [String] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            make = ["Mers", "BMW", "Honda", "Lotus"]
            year = make[2]
        }
    }
    
    
    
}

struct StateObjectView: View {
    @StateObject private var cars = Cars()
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5.0) {
            
            Picker(selection: $cars.year, label: Text("Picker")) {
                ForEach(cars.make, id: \.self) { car in
                    Text(car).tag(car)
                }
            }
            
            
            
            
        }
        
    }
}

struct StateObjectView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectView()
    }
}
