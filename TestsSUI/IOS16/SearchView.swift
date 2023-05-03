import SwiftUI


struct Mess: Identifiable, Codable {
    let id: Int
    var userName: String
    var text: String
}

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}

struct SearchView: View {
    @State private var messager = [Mess]()
    @State private var searchText = ""
    @State private var serachScop = SearchScope.inbox
    var body: some View {
        
        NavigationStack{
            List {
                ForEach(filterMess) { messa in
                    VStack {
                        Text(messa.userName)
                            .font(.headline)
                        
                        Text(messa.text)
                        
                    }
                }
            }
            .searchable(text: $searchText) {
                ForEach(SearchScope.allCases, id: \.self) { scope in
                    Text(scope.rawValue.capitalized)
                }
            }
            .navigationTitle("Messages")
        }
        .onSubmit(of: .search, runSearch)
        
        
        var filterMess: [Mess] {
            if searchText.isEmpty {
                return messager
            } else {
                return messager.filter { $0.text.localizedStandardContains(searchText) }
            }
        }
        
    }
    func runSearch() {
        Task {
            guard let url = URL(string: "https://hws.dev/\(serachScop.rawValue).json") else {
                return
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            messager = try JSONDecoder().decode([Mess].self, from: data)
        }
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
