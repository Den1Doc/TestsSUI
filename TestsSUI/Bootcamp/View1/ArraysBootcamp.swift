//
//  ArraysBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 08.04.2023.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificalViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filterArray: [UserModel] = []
    @Published var mappearray: [String] = []
 
    init() {
        getUsers()
        updateFilterArray()
    }
    
    func updateFilterArray() {
        
        // MARK: - map
//
//        mappearray = dataArray.map({ user -> String in
//            return user.name ?? "Error"
//        })

//        mappearray = dataArray.map({$0.name})
        
        
        
        // MARK: - filter
//        filterArray = dataArray.filter({ user -> Bool in
//            return user.points < 50
//        })
//        filterArray = dataArray.filter({$0.isVerified})
        
        
        // MARK: - sorted
//       filterArray = dataArray.sorted { (user1, user2) -> Bool in
//            return user1.points > user2.points
//        }
        
//        filterArray = dataArray.sorted(by: { $0.points > $1.points })
        
//        let sort = dataArray.sorted(by: {$0.points > $1.points})
//        let filter = dataArray.filter({$0.isVerified})
//        let map = dataArray.compactMap({$0.name})
        
        mappearray = dataArray
                            .sorted(by: {$0.points > $1.points})
                            .filter({$0.isVerified})
                            .compactMap({$0.name})
        
    }
    
    
    func getUsers() {
        let user1 = UserModel(name: "Ник", points: 5, isVerified: true)
        let user2 = UserModel(name: "Руся", points: 50, isVerified: false)
        let user3 = UserModel(name: nil, points: 20, isVerified: true)
        let user4 = UserModel(name: "Саша", points: 78, isVerified: false)
        let user5 = UserModel(name: "Паша", points: 10, isVerified: false)
        let user6 = UserModel(name: "Леша", points: 15, isVerified: true)
        let user7 = UserModel(name: "Ира", points: 51, isVerified: true)
        let user8 = UserModel(name: nil, points: 1, isVerified: false)
        let user9 = UserModel(name: "Люда", points: 100, isVerified: false)
        let user10 = UserModel(name: "Аня", points: 27, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1, user2, user3, user4, user5, user6, user7, user8, user9, user10,
        
        ]
        
        )

    }
    
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificalViewModel()
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20.0) {
                
                ForEach(vm.mappearray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
//                ForEach(vm.filterArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                            HStack{
//                                Text("point: \(user.points)")
//                                Spacer()
//                                if user.isVerified {
//                                    Image(systemName: "flame.fill")
//                                }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
        
        
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
