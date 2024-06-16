import SwiftUI

struct RectangleView: View {
    let colors: [Color] = [.black, .brown, .cyan, .red, .purple]
    var body: some View {
        VStack {
            ForEach(colors, id: \.self) { color in
                Rectangle().fill(color.gradient)
            }
        }
        
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}
