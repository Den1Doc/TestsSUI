import SwiftUI

struct ColorMeshGradients: View {
    var body: some View {
        VStack {
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    .init(0, 0), .init(0.5, 0), .init(1, 0),
                    .init(0, 0.5), .init(0.3, 0.5), .init(1, 0.5),
                    .init(0, 1), .init(0.5, 1), .init(1, 1)
                ],
                colors: [
                    .gray, .purple, .indigo,
                    .orange, .cyan, .blue,
                    .yellow, .green, .teal
                ]
            )
            
            MeshGradient(
                width: 2,
                height: 2,
                points: [
                    .init(0, 0), .init(1, 0),
                    .init(0, 1), .init(1, 1)
                ],
                colors: [
                    .red, .purple,
                    .yellow, .green
                ]
            )
        }
        .ignoresSafeArea()
    }
}

