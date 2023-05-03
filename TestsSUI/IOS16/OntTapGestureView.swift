import SwiftUI

struct OntTapGestureView: View {
    var body: some View {
        
        Circle()
            .fill(.black)
            .frame(width: 100, height: 100, alignment: .center)
            .onTapGesture(coordinateSpace: .global) { location in
                print("Нажатие в области \(location)")
            }
    }
}

struct OntTapGestureView_Previews: PreviewProvider {
    static var previews: some View {
        OntTapGestureView()
    }
}
