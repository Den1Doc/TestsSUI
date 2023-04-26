//
//  DowloadingImagesBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 16.04.2023.
//

import SwiftUI

struct DowloadingImagesBootcamp: View {
    
    @StateObject var vm = DowloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(vm.dataArray) { model in
                    DowloadingImageRow(model: model)
                   
                }
            }
            .navigationTitle("Dowloading Images")
        }
        
        
    }
}

struct DowloadingImagesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DowloadingImagesBootcamp()
    }
}
