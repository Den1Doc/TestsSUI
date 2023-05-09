import SwiftUI

struct Swiftui: View {
    
    @StateObject private var vm: UnitTestViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        
        Text(vm.isPremium.description)
        
    }
}

struct Swiftui_Previews: PreviewProvider {
    static var previews: some View {
        Swiftui(isPremium: true)
    }
}
