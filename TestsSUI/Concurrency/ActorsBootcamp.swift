//
//  ActorsBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 28.10.2023.
//

import SwiftUI

class MyDataManager {
    static let instance = MyDataManager()
    private init() {}
    
    var data = [String]()
    private let queue = DispatchQueue(label: "com.MyApp.MyDataManager")
    
    func getRandomData(completionHandler: @escaping(_ title: String?) -> ()) {
        queue.async {
            self.data.append(UUID().uuidString)
            completionHandler(self.data.randomElement())
        }
    }
}


struct HomeView: View {
    
    let manager = MyDataManager.instance
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.1, tolerance: nil, on: .main, in: .common, options: nil).autoconnect()
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.2).ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            DispatchQueue.global(qos: .background).async {
                manager.getRandomData { title in
                    if let data = title {
                        self.text = data
                        DispatchQueue.main.async {
                            self.text = data
                        }
                    }
                }
            }
        }
    }
}

struct SearchViewOne: View {
    
    let manager = MyDataManager.instance
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.01, tolerance: nil, on: .main, in: .common, options: nil).autoconnect()
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2).ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            DispatchQueue.global(qos: .background).async {
                manager.getRandomData { title in
                    if let data = title {
                        self.text = data
                        DispatchQueue.main.async {
                            self.text = data
                        }
                    }
                }
            }
        }
    }
}

struct ActorsBootcamp: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            
            SearchViewOne()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            
        }
    }
}

#Preview {
    ActorsBootcamp()
}
