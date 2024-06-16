import SwiftUI
import StoreKit

struct RequestReviewFromUserView: View {
    
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Review the app") {
            requestReview()
        }
    }
}

struct RequestReviewFromUserView_Previews: PreviewProvider {
    static var previews: some View {
        RequestReviewFromUserView()
    }
}
