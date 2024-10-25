import SwiftUI

struct ScrollTargetLayout: View {
    var body: some View {
        
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hue: Double(index) / 10, saturation: 1, brightness: 1).gradient)
                        .frame(width: 300, height: 100)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 40)
        
    }
}

//MARK: - ScrollTargetBehavior
struct ScrollTargetBehavior: View {
    var body: some View {
        ScrollView {
            ForEach(0..<50) { index in
                Text("Item \(index)")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 20))
            }
        }
        .scrollTargetBehavior(.paging)
    }
}

//MARK: - ScrollClipDisabled
struct ScrollClipDisabled: View {
    var body: some View {
        VStack {
            Text("Закреп в верхней части")
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.green)
                .foregroundStyle(.white)

            ScrollView {
                ForEach(0..<5) { _ in
                    Text("ScrollView")
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(.blue)
                        .foregroundStyle(.white)
                }
            }
            .scrollClipDisabled()

            Text("Закреп в нижней части")
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.green)
                .foregroundStyle(.white)
        }
    }
}

//MARK: - ScrollTransition
struct ScrollTransition: View {
    var body: some View {
        ScrollView {
            ForEach(0..<10) { index in
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue)
                    .frame(height: 80)
                    .shadow(radius: 3)
                    .scrollTransition { content, phase in
                        content
                            .hueRotation(.degrees(45 * phase.value))
                    }
                    .padding(.horizontal)
            }
        }
     
    }
}


//MARK: - VisualEffect
struct VisualEffect: View {
    var body: some View {
        ScrollView {
            ForEach(0..<10) { index in
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue)
                    .frame(height: 80)
                    .shadow(radius: 3)
                    .scrollTransition { content, phase in
                        content
                            .hueRotation(.degrees(45 * phase.value))
                    }
                    .padding(.horizontal)
            }
        }
     
    }
}


