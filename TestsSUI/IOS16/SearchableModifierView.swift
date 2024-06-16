import SwiftUI

struct Message: Identifiable, Codable {
    let id: Int
    var user: String
    var text: String
}

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}

struct SearchableModifierView: View {
    
    @State private var messages: [Message] = []
    @State private var searchText: String = ""
    @State private var searchScope: SearchScope = .inbox
    
    var filteredMessages: [Message] {
        if searchText.isEmpty {
            return messages
        } else {
            return messages.filter {
                $0.text.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredMessages) { message in
                    VStack(alignment: .leading) {
                        Text(message.user)
                            .font(.headline)
                        
                        Text(message.text)
                    }
                }
            }
            .searchable(text: $searchText)
            .searchScopes($searchScope) {
                Text("Inbox").tag(SearchScope.inbox)
                Text("Favorites").tag(SearchScope.favorites)
                
            }
            .navigationTitle("Messages")
        }
        .onSubmit(of: .search, runSearch)
        .onChange(of: searchScope) { _ in
            runSearch()
        }
        .onAppear {
            runSearch()
        }
    }

    func runSearch() {
        Task {
            guard let url = URL(string: "https://hws.dev/\(searchScope.rawValue).json") else { return }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            messages = try JSONDecoder().decode([Message].self, from: data)
        }
    }
}

struct SearchableModifierView_Previews: PreviewProvider {
    static var previews: some View {
        SearchableModifierView()
    }
}
