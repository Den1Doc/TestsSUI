import SwiftUI

final class NameInfo: ObservableObject {
    @Published var name: String = "Hello"
}

struct One: View {
    var body: some View {
        Text("One")
    }
}

struct Two: View {
    @AppStorage("name") private var user = ""
    var body: some View {
        TextField("User", text: $user)
            .padding()
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.red.cornerRadius(10))
            .padding()
    }
}

struct EnvironmentObjectView: View {
    @EnvironmentObject var infoName: NameInfo
    var body: some View {
        
        TabView {
            One()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("One")
                }
            
            Two()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Two")
                }
        }
//        .environmentObject(NameInfo())
    }
}

struct EnvironmentObjectView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView()
//            .environmentObject(NameInfo())
    }
}
