import XCTest
//@testable import UnitTesting
import Combine


final class UnitViewModel_Test: XCTestCase {
    
    var viewModel: UnitTestViewModel?
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UnitTestViewModel(isPremivum: Bool.random())
        
        
        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
            viewModel = nil
        }
        
        func test_UnitTestViewModel_isPremium_sholdBeTrue() {
            
            let userIsPrem: Bool = true
            
            let vm = UnitTestViewModel(isPremium: userIsPrem)
            
            XCTAssertTrue(vm.isPremium)
        }
        
        func test_UnitTestViewModel_isPremium_cFalse() {
            
            let userIsPrem: Bool = false
            
            let vm = UnitTestViewModel(isPremium: userIsPrem)
            
            XCTAssertFalse(vm.isPremium)
        }
        
        func test_UnitTestViewModel_isPremium_sholdBeInjectedValue() {
            
            let userIsPrem: Bool = Bool.random()
            
            let vm = UnitTestViewModel(isPremium: userIsPrem)
            
            XCTAssertEqual(vm.isPremium, userIsPrem)
        }
        
        func test_UnitTestViewModel_isPremium_sholdBeInjectedValue_stress() {
            for _ in 0..<10 {
                let userIsPrem: Bool = Bool.random()
                
                let vm = UnitTestViewModel(isPremium: userIsPrem)
                
                XCTAssertEqual(vm.isPremium, userIsPrem)
            }
        }
        
        func test_UnitTestViewModel_dataArray_sholdBeInEmpty() {
            
            let vm = UnitTestViewModel(isPremium: Bool.random())
            
            XCTAssertTrue(vm.dataArray.isEmpty)
            XCTAssertEqual(vm.dataArray.count, 0)
        }
        
        func test_UnitTestViewModel_dataArray_sholdBeInAddItem() {
            
            let vm = UnitTestViewModel(isPremium: Bool.random())
            
            let loopCount: Int = Int.random(in: 1..<100)
            for _ in 0..<loopCount {
                vm.addItem(item: UUID().uuidString)
            }
            
            XCTAssertTrue(!vm.dataArray.isEmpty)
            XCTAssertFalse(vm.dataArray.isEmpty)
            XCTAssertEqual(vm.dataArray.count, loopCount)
            XCTAssertNotEqual(vm.dataArray.count, 0)
            XCTAssertGreaterThan(vm.dataArray.count, 0)
        }
        
        func test_UnitTestViewModel_dataArray_sholdBeInNoStr() {
            
            let vm = UnitTestViewModel(isPremium: Bool.random())
            
            vm.addItem(item: "")
            
            XCTAssertTrue(vm.dataArray.isEmpty)
            
        }
        
        func test_UnitTestViewModel_dataArray_sholdBeInNoStr2() {
            
            guard let vm = viewModel else {
                XCTFail()
                return
            }
            
            vm.addItem(item: "")
            
            XCTAssertTrue(vm.dataArray.isEmpty)
            
        }
        
        func test_UnitTestViewModel_selectedItem_sholdBeInAsNil() {
            
            let vm = UnitTestViewModel(isPremium: Bool.random())
            
            
            XCTAssertTrue(vm.selectedItem == nil)
            XCTAssertNil(vm.selectedItem)
            
        }
        
        func test_UnitTestViewModel_selectedItem_sholdBeNilInAsNil() {
            
            let vm = UnitTestViewModel(isPremium: Bool.random())
            
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            vm.selectedItem(item: newItem)
            
            vm.selectedItem(item: UUID().uuidString)
            
            XCTAssertNil(vm.selectedItem)
            
        }
        
        func test_UnitTestViewModel_selectedItem_sholdBeSelected() {
            
            let vm = UnitTestViewModel(isPremium: Bool.random())
            
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            vm.selectedItem(item: newItem)
            
            XCTAssertNotNil(vm.selectedItem)
            XCTAssertEqual(vm.selectedItem, newItem)
            
        }
        
        func test_UnitTestViewModel_selectedItem_sholdBeSelected_stress() {
            
            let vm = UnitTestViewModel(isPremium: Bool.random())
            
            let loopCount: Int = Int.random(in: 0..<100)
            var itemArray: [String] = []
            for _ in 0..<loopCount {
                let newItem = UUID().uuidString
                vm.addItem(item: newItem)
                itemArray.append(newItem)
            }
            
            let randomItem = itemArray.randomElement() ?? ""
            XCTAssertFalse(randomItem.isEmpty)
            vm.selectedItem(item: randomItem)
            
            XCTAssertNotNil(vm.selectedItem)
            XCTAssertEqual(vm.selectedItem, randomItem)
            
        }
        
        func test_UnitTestViewModel_saveItem_sholdBeSelected_noData() {
            
            let vm = UnitTestViewModel(isPremium: Bool.random())
            
            let loopCount: Int = Int.random(in: 0..<100)
            for _ in 0..<loopCount {
                vm.addItem(item: UUID().uuidString)
            }
            
            do {
                try vm.saveItem(item: "")
            } catch let error {
                let returnedError = error as? UnitTestViewModel.DataError
                XCTAssertEqual(returnedError, UnitTestViewModel.DataError.noData)
            }
            
        }
        
        func test_UnitTestViewModel_saveItem_sholdSaveItem() {
            
            let vm = UnitTestViewModel(isPremium: Bool.random())
            
            let loopCount: Int = Int.random(in: 0..<100)
            var itemArray: [String] = []
            
            for _ in 0..<loopCount {
                let newItem = UUID().uuidString
                vm.addItem(item: newItem)
                itemArray.append(newItem)
            }
            
            let randomItem = itemArray.randomElement() ?? ""
            XCTAssertFalse(randomItem.isEmpty)
            
            XCTAssertNoThrow(try vm.saveItem(item: randomItem))
            
            do {
                try vm.saveItem(item: randomItem)
            } catch let error {
                XCTFail()
            }
            
        }
        
        func test_UnitTestViewModel_downloadCombine_sholdReturn() {
            
            let vm = UnitTestViewModel(isPremium: Bool.random())
            let expectation = XCTestExpectation(description: "show return 3 sec")
            
            vm.$dataArray
                .dropFirst()
                .sink { returnItems in
                    expectation.fulfill()
                }
                .store(in: &cancellables)
            
            vm.downloadWithCombine()
            
            
            wait(for: [expectation], timeout: 5)
            XCTAssertGreaterThan(vm.dataArray.count, 0)
            
            
        }
        
        
    }
}
