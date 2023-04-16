//
//  ThreadsBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 09.04.2023.
//

import SwiftUI

class ThreadsViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func fetchData() {
        
        DispatchQueue.global(qos: .background).async {
            let newData = self.dowloadData()
            
//            print("1: \(Thread.isMainThread)")
//            print("1: \(Thread.current)")
            
            DispatchQueue.main.async {
                self.dataArray = newData
//                print("2: \(Thread.isMainThread)")
//                print("2: \(Thread.current)")
            }
            
        }
        
    }
    
   private func dowloadData() -> [String] {
        var data: [String] = []
        
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
    
}

struct ThreadsBootcamp: View {
    
    @StateObject var vm = ThreadsViewModel()
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 10.0) {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { data in
                    Text(data)
                        .font(.headline)
                        .foregroundColor(.red)
                }
                
                
            }
        }
        
    }
}

struct ThreadsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ThreadsBootcamp()
    }
}
