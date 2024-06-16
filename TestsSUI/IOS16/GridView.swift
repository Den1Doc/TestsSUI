import SwiftUI

struct FixedGridView: View {
    var body: some View {
        Grid {
            GridRow {
                Text("Top Leading")
                    .background(.red)
                Text("Top Trailing")
                    .background(.orange)
            }
            
            GridRow {
                Text("Bottom Leading")
                    .background(.blue)
                Text("Bottom Trailing")
                    .background(.green)
            }
        }
    }
}

struct FixedGridView2: View {
    @State private var redScore = 0
    @State private var blueScore = 0
    var body: some View {
        Grid {
            GridRow {
                Text("Red")
                ForEach(0..<redScore, id: \.self) { _ in
                    Rectangle()
                        .fill(.red)
                        .frame(width: 20, height: 20)
                }
            }
            
            GridRow {
                Text("Blue")
                ForEach(0..<blueScore, id: \.self) { _ in
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 20, height: 20)
                }
            }
            Button("Red score") {
                redScore += 1
            }
            .foregroundColor(.white)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.red)
            )
            
            
            Button("Blue score") {
                blueScore += 1
            }
            .foregroundColor(.white)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.blue)
            )
            
        }
    }
}

struct FixedGridView3: View {
    @State private var redScore = 0
    @State private var blueScore = 0
    var body: some View {

        Grid {
            GridRow {
                Text("Food")
                Text("$200")
            }
            GridRow {
                Text("Rent")
                Text("$600")
            }
            GridRow {
                Text("Water")
                Text("$80")
            }
            Divider()
            GridRow {
                Text("$880")
                    .gridCellColumns(2)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 64)

            }
        }
        .font(.title)
    }
}

struct FixedGridView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FixedGridView()
            FixedGridView2().previewDisplayName("FixedGridView 2")
            FixedGridView3().previewDisplayName("FixedGridView 3")
        }
    }
}
