import SwiftUI

struct ControlScrollViews: View {
    
    let text = ["copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc","copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc","copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc","copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc","copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc","copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc", "copwcpowejcwopecmpowecmewcpomwecmwepocjpowjecpowcmpowmcpowcmwpocmpwmc",]
    
    @State private var showScrollToTop = false
    
    var body: some View {
          ScrollView {
              VStack {
                  ForEach(text, id: \.self) { text in
                      Text(text)
                          .frame(height: 200)
                          
                  }
              }
          }
          .padding(.horizontal)
          .overlay(alignment: .bottom) {
              if showScrollToTop {
                  Button("Прокрутка до начала") { }
                  .controlSize(.extraLarge)
                  .buttonStyle(.borderedProminent)
                  .tint(.green)
              }
          }
          .onScrollGeometryChange(for: Bool.self) { geometry in
              geometry.contentOffset.y < geometry.contentInsets.bottom + 200
              
          } action: { oldValue, newValue in
              withAnimation {
                  showScrollToTop = !newValue
              }
          }

      }
  }

#Preview {
    ControlScrollViews()
}
