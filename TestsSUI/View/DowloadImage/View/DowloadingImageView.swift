//
//  DowloadingImageView.swift
//  TestsSUI
//
//  Created by Денис Мишин on 16.04.2023.
//

import SwiftUI

struct DowloadingImageView: View {
    
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String, key: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    
    @State var isLoading: Bool = true
    var body: some View {
        
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
        
    }
}

struct DowloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DowloadingImageView(url: "https://via.placeholder.com/600/92c952", key: "1")
            .frame(width: 75, height: 75)
            .previewLayout(.sizeThatFits)
    }
}
