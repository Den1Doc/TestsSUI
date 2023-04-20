import SwiftUI

class CarInfo: ObservableObject {
    @Published var bmw = ""
    @Published var shoda = ""
}

struct ObservableObjectView: View {
    @StateObject var carInfo = CarInfo()
    var body: some View {
        
        
            GroupBox(label: Text("Cars")) {
                TextField("car bmw", text: $carInfo.bmw)
                    .textFieldStyle(.roundedBorder)
                TextField("car shoda", text: $carInfo.shoda)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            
        
        
        
    }
}

struct ObservableObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectView()
    }
}
