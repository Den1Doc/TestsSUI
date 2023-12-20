//
//  AsyncStreamBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 20.12.2023.
//

import SwiftUI

class AsyncStreamDataManager {
    
    func getAsyncStream() -> AsyncThrowingStream<Int, Error> {
        AsyncThrowingStream { [weak self] contionuation in
            self?.getFakeData { value in
                contionuation.yield(value)
            } onFinish: { error in
                if let error {
                    contionuation.finish(throwing: error)
                } else {
                    contionuation.finish()
                }
            }
        }
    }
    
    func getFakeData(newValue: @escaping (_ value: Int) -> Void,
                     onFinish: @escaping (_ error: Error?) -> Void) {
        let items: [Int] = [1,2,3,4,5,6,7]
        for item in items {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(item), execute:  {
                if item == items.last {
                    onFinish(nil)
                }
            })
        }
    }
    
}

@MainActor final class AsyncStreamViewModel: ObservableObject {
    
    let manager = AsyncStreamDataManager()
    @Published private(set) var currentNumber: Int = 0
    
    func onViewAppear() {
        //        manager.getFakeData { [weak self] value in
        //            self?.currentNumber = value
        //        }
        Task {
            do {
                for try await value in manager.getAsyncStream() {
                    currentNumber = value
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
}

struct AsyncStreamBootcamp: View {
    
    @StateObject private var vm = AsyncStreamViewModel()
    
    var body: some View {
        Text("\(vm.currentNumber)")
            .onAppear {
                vm.onViewAppear()
            }
    }
}

#Preview {
    AsyncStreamBootcamp()
}
