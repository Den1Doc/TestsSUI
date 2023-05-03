import SwiftUI

struct NavStack: View {
//    @State private var presenInt = [1,2,4]
//    @State private var present = NavigationPath()
    
    @State private  var play = ["Dan","Ben","Ray"]
    @State private var selectionPlay: String?
    
    var body: some View {
        
//
//        NavigationStack(path: $present) {
//            NavigationLink(value: "String") {
//                Text("Tap")
//            }
//            List(1..<100) { i in
//                NavigationLink(value: i) {
//                    Label("Привет \(i)", systemImage: "\(i).circle")
//                }
//                .navigationTitle("NavigationStack")
//            }
//            .navigationDestination(for: Int.self) { i in
//                Text("Как дела? \(i)")
//            }
//            .navigationDestination(for: String.self) { s in
//                Text("Str: \(s)")
//            }
//        }
//
//
//        NavigationStack {
//            List(1..<100) { i in
//                NavigationLink(value: i) {
//                    Label("Привет \(i)", systemImage: "\(i).circle")
//                }
//                .navigationTitle("NavigationStack")
//            }
//            .navigationDestination(for: Int.self) { i in
//                Text("Как дела?")
//            }
//        }

//MARK: работает на iPad, лучше всего
        NavigationSplitView {
            List(play, id: \.self, selection: $selectionPlay, rowContent: Text.init)
        } detail: {
            Text(selectionPlay ?? "Выбери игрока")
        }
    }
}



struct NavStack_Previews: PreviewProvider {
    static var previews: some View {
        NavStack()
    }
}
