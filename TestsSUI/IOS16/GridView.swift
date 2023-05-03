import SwiftUI

struct GridView: View {
    var body: some View {
        
        Grid {
            GridRow {
                Text("Hsjd")
                    .background(.cyan)
            }
            GridRow {
                Text("sdlds")
                    .background(.brown)
            }
            GridRow {
                Text("sd")
                    .background(.green)
                Text("GHsc")
                    .background(.green)
            }
        }    
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
