//
//  AsyncImage.swift
//  TestsSUI
//
//  Created by Денис Мишин on 26.04.2023.
//

import SwiftUI

struct AsyncImageView: View {
   private let url = URL(string: "https://fastly.picsum.photos/id/916/200/200.jpg?hmac=hEUrLG-ayFdIoyHKUwazT8SMEsVxWH9xGz4tx-e0cN0")
    var body: some View {
        
        
        AsyncImage(url: url, scale: 2.0) { phase in
            if let image = phase.image {
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .cornerRadius(10)
                    .overlay(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                    
            } else {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
                
        }
        
        
        
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
