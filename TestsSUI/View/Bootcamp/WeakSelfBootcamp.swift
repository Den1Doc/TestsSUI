//
//  WeakSelfBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 08.04.2023.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    
    @AppStorage("count") var count: Int?
    
    var body: some View {
        
        NavigationView {
            NavigationLink("Navigate", destination: WeakSelfScreen())
                .navigationTitle("Screen 1")
        }
        .overlay(alignment: .topTrailing) {
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green.cornerRadius(10))
        }
    }
}

struct WeakSelfScreen: View {
    @StateObject var vm = WeakSelfViewModel()
    var body: some View {
        Text("Second View")
            .font(.largeTitle)
            .foregroundColor(.red)
        
        if let data = vm.data {
            Text(data)
        }
        
    }
}


class WeakSelfViewModel: ObservableObject {
    
    @Published var data: String? = nil
    
    init() {
        print("Init now")
        let currrentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currrentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("deinit now")
        let currrentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currrentCount - 1, forKey: "count")
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "New data"
        }
    }
    
}

struct WeakSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootcamp()
    }
}
