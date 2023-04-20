import SwiftUI

class Names{
    var firstName = "Hello"
    var lastName = "World"
    init(firstN: String, lastN: String) {
        firstName = firstN
        lastName = lastN
    }
}

struct BindingView: View {
    @Binding var name: Names
    var body: some View {
        
        VStack {
            Text(name.firstName)
            Text(name.lastName)
        }
        
    }
}

struct BindingView_Previews: PreviewProvider {
    @State static var names = Names(firstN: "Hello", lastN: "World")
    static var previews: some View {
        BindingView(name: $names)
    }
}
