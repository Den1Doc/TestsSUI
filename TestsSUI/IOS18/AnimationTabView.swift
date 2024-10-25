import SwiftUI

enum TabViewAnimation: String, CaseIterable  {
    
    case viewOne = "plus.app"
    case viewTwo = "gearshape"
    
    var title: String {
        switch self {
        case .viewOne: return "viewOne"
        case .viewTwo: return "ViewTwo"
        }
    }
    
}

struct AnimationTabViewIOS18: View {
    
    @State private var actionTab: TabViewAnimation = .viewOne
    @State private var imageSystemName: TabViewAnimation?
    
    var body: some View {
        
        TabView(selection: .init(get: {
            return actionTab
        }, set: { newValue in
            actionTab = newValue
            imageSystemName = newValue
            var transaction = Transaction()
            transaction.disablesAnimations = true
            withTransaction(transaction) { imageSystemName = nil }
        })) {
            
           
            Tab.init(value: .viewOne) {
                ViewOne()
            }
            
            Tab.init(value: .viewTwo) {
                ViewTwo()
            }
            
        }
        .overlay(alignment: .bottom) {
            AnimationTabBar()
        }
        
    }
    
    
    @ViewBuilder private func AnimationTabBar() -> some View {
        
        HStack(spacing: 0) {
            ForEach(TabViewAnimation.allCases, id: \.rawValue) { tab in
                VStack(spacing: 0) {
                    Image(systemName: tab.rawValue)
                        .font(.title3)
                        .symbolVariant(.fill)
                        .modifiers { content in
                            switch tab {
                            case .viewOne: content .symbolEffect(.bounce.down.byLayer, value: imageSystemName == tab)
                            case .viewTwo: content .symbolEffect(.bounce.down.byLayer, value: imageSystemName == tab)
                            }
                        }
                    
                    Text(tab.title)
                        .font(.caption2)
                    
                }
                .foregroundStyle(actionTab == tab ? Color.primary : Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity)
            }
        }
        .allowsHitTesting(false)
        .frame(height: 48)
    }
    
}

extension View {
    
    @ViewBuilder func modifiers<Content: View>(@ViewBuilder content: @escaping (Self) -> Content) -> some View {
        content(self)
    }
    
}

fileprivate struct ViewOne: View {
    
    var body: some View {
        Text("ViewOne")
    }
}

fileprivate struct ViewTwo: View {
    
    var body: some View {
        Text("ViewOne")
    }
}
