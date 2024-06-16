import SwiftUI

struct AnyLayotView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {

        let lay = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
    
            lay {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .font(.largeTitle)
        
    }
    
}

struct AnyLayotView_Previews: PreviewProvider {
    static var previews: some View {
        AnyLayotView()
    }
}
