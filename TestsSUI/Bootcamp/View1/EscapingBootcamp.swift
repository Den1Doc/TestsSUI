//
//  EscapingBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 31.03.2023.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData4 { [weak self] (returnResult) in
            self?.text = returnResult.data
        }
    }
    
    func downloadData() -> String {
        return "New data!"
    }
    
    func downloadData2(completionhandler: (_ data: String) -> Void) {
        completionhandler("New data!")
    }
    
    func downloadData3(completionhandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionhandler("New data!")
        }
    }
   
    func downloadData4(completionhandler: @escaping (DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!")
            completionhandler(result)
        }
    }
  
    func downloadData5(completionhandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!")
            completionhandler(result)
        }
    }
    
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}
