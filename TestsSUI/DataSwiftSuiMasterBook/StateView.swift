import SwiftUI

struct NameData {
    let firstName = "Saha"
    let lastName = "Olay"
}

struct StateView: View {
    @State private var nameData = NameData()
    @State private var name: String = "Den"
    var body: some View {
        VStack {
            Text(name)
            Text(nameData.firstName)
            Text(nameData.lastName)
            Text("\(nameData.lastName), \(nameData.firstName)")
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
