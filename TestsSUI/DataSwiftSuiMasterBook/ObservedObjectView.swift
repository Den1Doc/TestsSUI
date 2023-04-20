//
//  ObservedObjectView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 20.04.2023.
//

import SwiftUI

class Forecast: ObservableObject {
    
    @Published var sevenDays: [Weather] = []
    
    struct Weather: Identifiable {
        let id = UUID()
        var day = ""
        var icon = ""
    }
    
    init() { sevenDays =
        [
            Weather(day: "Понедельник", icon: "cloud.snow.fill"),
            Weather(day: "Вторник", icon: "sun.min.fill"),
            Weather(day: "Среда", icon: "cloud.sleet.fill")
        ]
    }
}

struct ObservedObjectView: View {
//    @StateObject private var forecast = Forecast()
    @ObservedObject var forecast: Forecast
    @State private var show: Bool = false
    var body: some View {
        
        VStack {
           
           Text("Hello world")
            
        }
        
        
    }
}

struct ObservedObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectView(forecast: Forecast())
    }
}
