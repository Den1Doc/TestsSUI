//
//  DowloadingImageRow.swift
//  TestsSUI
//
//  Created by Денис Мишин on 16.04.2023.
//

import SwiftUI

struct DowloadingImageRow: View {
    let model: PhotoModel
    var body: some View {
        HStack {
            DowloadingImageView(url: model.url, key: "\(model.id)")
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct DowloadingImageRow_Previews: PreviewProvider {
    static var previews: some View {
        DowloadingImageRow(model: PhotoModel(albumId: 1, id: 1, title: "Title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/600/92c952"))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
