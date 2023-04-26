//
//  URLView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 26.04.2023.
//

import SwiftUI

struct UserOne: Identifiable, Decodable {
    var id: Int
    var name: String
    var email: String
}

struct URLView: View {
    @State private var users: [UserOne] = []
    private let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    @State private var searchText = ""
    var body: some View {
        
        NavigationView {
            List{
                ForEach(users) { user in
                    VStack(alignment: .leading, spacing: 4.0) {
                        Text(user.name)
                        Text(user.email).font(.caption)
                    }
                    .listRowSeparatorTint(.red)
                    .listRowSeparator(.hidden)
                }
            }
            .refreshable {
                await getUsers()
            }
            .searchable(text: $searchText) {
                ForEach(users.filter { user in searchText == "" ? true : user.email.lowercased().contains(searchText.lowercased())
                    }) { user in
                    Text(user.email)
                            .searchCompletion(user.name)
                }
            }
            .navigationTitle("Pull to Refresh")
        }
    }
    
    
    func getUsers() async {
        let session = URLSession(configuration: .default)
        do {
            let task = try await session.data(from: url)
            let users = try JSONDecoder().decode([UserOne].self, from: task.0)
            self.users = users
        } catch {
            print("Error")
        }
    }
    
}
    


struct URLView_Previews: PreviewProvider {
    static var previews: some View {
        URLView()
    }
}
