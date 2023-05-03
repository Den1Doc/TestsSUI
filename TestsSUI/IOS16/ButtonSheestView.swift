import SwiftUI

struct ButtonSheestView: View {
    @State private var showMany = false
    var body: some View {
        Button("Нажми на меня! Прошу") {
            showMany.toggle()
        }
        .sheet(isPresented: $showMany) {
            Text("Спасибо за деньги!")
//                .presentationDetents([.medium, .large])
//                .presentationDetents([.large, .medium])
                .presentationDetents([.fraction(0.5)])
                .presentationDragIndicator(.hidden)
        }
    }
}

struct ButtonSheestView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSheestView()
    }
}
