import SwiftUI

struct OnKeyPress: View {
    
    @FocusState private var focused: Bool
    @State private var key = ""
    
    var body: some View {
        Text(key)
            .focusable()
            .focused($focused)
            .onKeyPress { press in
                key += press.characters
                return .handled
            }
            .onAppear { focused = true }
    }
}

#Preview {
    OnKeyPress()
}
