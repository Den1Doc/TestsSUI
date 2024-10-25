import SwiftUI

struct PlaceholderCostom: View {
    
    @State var drages: CGFloat = 0
    @State var drages1: CGFloat = 0
    @State var drages2: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            CircleView(w: 80, h: 80, drages: drages, color: .blue)
            CircleView(w: 60, h: 60, drages: drages, color: .gray)
            CircleView(w: 40, h: 40, drages: drages, color: .red)
        }
        .onAppear {
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) { drages = 360 }
            withAnimation(.linear(duration: 0.7).repeatForever(autoreverses: false)) { drages = 360 }
            withAnimation(.linear(duration: 0.9).repeatForever(autoreverses: false)) { drages = 360 }
        }
        
    }
}

struct CircleView: View {
    
    var w: CGFloat
    var h: CGFloat
    var drages: CGFloat
    var color: Color
    
    var body: some View {
        
        Circle()
            .trim(from: 0, to: 0.5)
            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .frame(width: w, height: h)
            .rotationEffect(.degrees(drages))
            .foregroundStyle(color)
        
    }
}

#Preview {
    PlaceholderCostom()
}
