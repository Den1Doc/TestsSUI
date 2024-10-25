import SwiftUI

struct ButtonRepeatBehavior: View {
    @State private var tapCount = 0

      var body: some View {
          Button("Количество: \(tapCount)") {
              tapCount += 1
          }
          .buttonRepeatBehavior(.enabled)
    }
}

#Preview {
    ButtonRepeatBehavior()
}
