import SwiftUI

struct AnimationsSFSymbols: View {
    @State private var animate = false
    var body: some View {
        Image(systemName: "ellipsis.message")
            .font(.system(size: 300))
            .symbolRenderingMode(.palette)
            .foregroundStyle(.purple, .gray)
            .symbolEffect(.rotate, value: animate)
            .onTapGesture {
                animate.toggle()
            }
    }
}

