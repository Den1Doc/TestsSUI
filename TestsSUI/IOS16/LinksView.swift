import SwiftUI

struct LinksView: View {
    var body: some View {
        let link = URL(string: "https://developer.apple.com/tutorials/swiftui")!
        
        VStack(spacing: 20) {
            ShareLink(item: link)
            ShareLink("Swiftui", item: link)
            ShareLink(item: link) {
                Label("Swiftui", systemImage: "swift")
            }
        }
        
    }
}

struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView()
    }
}
