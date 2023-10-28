import SwiftUI

struct NavStack: View {
    
    @State private var present = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $present) {
            NavigationLink(value: "String") {  }
            List(1..<100) { i in
                NavigationLink(value: i) {
                    Label("Привет \(i)", systemImage: "\(i).circle")
                }
                .navigationTitle("NavigationStack")
            }
            .navigationDestination(for: Int.self) { i in
                Text("Как дела? \(i)")
            }
        }
    }
}



struct NavStack_Previews: PreviewProvider {
    static var previews: some View {
        NavStack()
    }
}
