import SwiftUI

struct AlternativeStackLayout: Layout {
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard !subviews.isEmpty else { return .zero}
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let allWidth = subviewSizes.map { $0.width }
        let evenWidthMax = allWidth.enumerated()
            .filter { $0.0.isMultiple(of: 2) }
            .map {$0.1}
            .max()
        
        let oddWidthMax = allWidth.enumerated()
            .filter { !$0.0.isMultiple(of: 2) }
            .map {$0.1}
            .max()
        
        let totalHeight = subviewSizes.map { $0.height}
            .reduce(0, +)
   
        return CGSize(width: evenWidthMax! + (oddWidthMax ?? 0), height: totalHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard !subviews.isEmpty else { return }
        
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let allWidth = subviewSizes.map { $0.width }
        let evenWidthMax = allWidth.enumerated()
            .filter { $0.0.isMultiple(of: 2) }
            .map {$0.1}
            .max()
        
        let evenX = bounds.minX
        let oddX = bounds.minX + evenWidthMax!
        
        var y = bounds.minY
        for (index, subview) in subviews.enumerated() {
            let subviewSize = subviewSizes[index]
            
            let proposedSize = ProposedViewSize(width: subviewSize.width, height: subviewSize.height)
            if index.isMultiple(of: 2) {
                subview.place(at: CGPoint(x: evenX, y: y), anchor: .topLeading, proposal: proposedSize)
            } else {
                subview.place(at: CGPoint(x: oddX, y: y), anchor: .topLeading, proposal: proposedSize)
            }
            y += subviewSize.height
        }
    }
    
    
}

struct MyColors {
    
    var color: Color
    var width: CGFloat
    var height: CGFloat
    
    static var allColors:[MyColors] {[
        .init(color: .red, width: 60, height: 75),
        .init(color: .teal, width: 100, height: 100),
        .init(color: .purple, width: 40, height: 80),
        .init(color: .indigo, width: 120, height: 100)
    ]}
}


struct AnyLayoutExample2: View {

    @State private var layoutType: LayoutType = .zStack

    var body: some View {
        let layout = AnyLayout(layoutType.layout)
        NavigationStack {
            layout {
                ForEach(MyColors.allColors, id: \.color) { myColor in
                    myColor.color
                        .frame(width: myColor.width, height: myColor.height)
                }
            }
            .padding()
            .navigationTitle("AnyLayout")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            if layoutType == .zStack {
                                layoutType = .hStack
                            } else if layoutType == .hStack {
                                layoutType = .vStack
                            } else if layoutType == .vStack {
                                layoutType = .altStack
                            } else if layoutType == .altStack {
                                layoutType = .zStack
                            }
                        }
                    } label: {
                        Image(systemName: "list.bullet.rectangle")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}

struct AnyLayoutExample2_Previews: PreviewProvider {
    static var previews: some View {
        AnyLayoutExample2()
    }
}

enum LayoutType: Int, CaseIterable {
    case zStack, hStack, vStack, altStack
    
    var index: Int {
        LayoutType.allCases.firstIndex(where: {$0 == self})!
    }
    
    var layout: any Layout {
        switch self {
        case .zStack:
            return ZStackLayout()
        case .hStack:
            return HStackLayout(alignment: .top, spacing: 0)
        case .vStack:
            return VStackLayout(alignment: .trailing)
        case .altStack:
            return AlternativeStackLayout()
        }
    }
}
