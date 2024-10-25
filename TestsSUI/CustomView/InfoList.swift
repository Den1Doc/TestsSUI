import SwiftUI

struct InfoView: View {
    var title: String
    @Binding var text: String
    @FocusState var isActive
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            
            Text(title)
                .padding(.horizontal)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .foregroundStyle(isActive ? .black : .secondary)
                .animation(.spring, value: isActive)
        }
    }
}

struct SwiftUIView: View {
    @State var email = ""
    @State var name = ""

    var body: some View {
        VStack(spacing: 45) {
            InfoView(title: "Email", text: $email)
            InfoView(title: "Name", text: $name)
        }
    }
}



